from flask import Flask, request, jsonify
import firebase_admin
from firebase_admin import credentials, firestore
import functions_framework
from flask_cors import CORS


cred = credentials.Certificate("key.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

app = Flask(__name__)
CORS(app)


#Create an acoount 

@app.route('/profile', methods=['POST'])
def create_profile():
    new_user = request.get_json()
    s_ID = new_user['studentID']

    profile_ref = db.collection("profile")
    query = profile_ref.where("studentID", "==", str(s_ID))

    results = query.get()

    if not results:
        user_ref = profile_ref.document(str(s_ID))
        user_ref.set(new_user)
        return jsonify(new_user), 201

    else:

        return {'error': 'user with the same ID already exists'}

#Update user details

@app.route('/profile/', methods=['PUT'])
def profile_update():
    s_id = request.args.get("s_id")
    profile_ref = db.collection("profile")

    newuser_ref = profile_ref.document(str(s_id))

    if newuser_ref.get().exists:

        updated_profile = request.get_json()

        year_group = updated_profile['year_group']
        major = updated_profile['major']
        Best_Food = updated_profile['favfood']
        Best_Movie = updated_profile['favMovie']
        
        newuser_ref.update({
            'year_group': year_group,
            'major': major,
            'favfood': Best_Food,
            'favMovie': Best_Movie
        })

        return jsonify(updated_profile), 200
    else:

        return {'error': 'profile not found'}


#Retrieve user profile
# @app.route('/profile/<string:s_id>/', methods=['GET'])
@app.route('/profile', methods=['GET'])
def profile_view():
    studentId = request.args.get("s_id")
    profile_view_ref = db.collection("profile")
    newuser_ref = profile_view_ref.document(str(studentId))
    if newuser_ref.get().exists:
        profile = newuser_ref.get().to_dict()
        return jsonify(profile), 200
    else:
        return {'error': 'profile not found'}

@app.route('/feed', methods=['GET'])
def get_feed():
    posts_ref = db.collection("feed")
    posts = posts_ref.order_by("date", direction=firestore.Query.DESCENDING).limit(10).get()
    if posts:
        feed = []
        for post in posts:
            post_data = post.to_dict()
            feed.append({
                "postID": post_data.get("postID"),
                "title": post_data.get("title"),
                "content": post_data.get("content"),
                "date": post_data.get("date"),
                "student_name": post_data.get("student_name")
            })
        return jsonify(feed), 200
    else:
        return {'error': 'no posts found'}, 404





#app.run(debug=True)


#Send email notification
