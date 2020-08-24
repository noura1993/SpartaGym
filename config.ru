# config.ru
require "sinatra"
require_relative('./member_controller')
require_relative('./sparta_class_controller')
require "./app"

use MemberController
use SpartaClassController

run App
