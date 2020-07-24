Return-Path: virtio-comment-return-1367-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7AEF6985E7C
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Jul 2020 15:43:11 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Fri, 24 Jul 2020 16:42:44 +0100
Message-Id: <20200724154251.12546-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH  v2 0/7] doc build updates and terminology definitions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,

This contains both my previously posted build system tweaks and an
updated revision of the terminology patch I posted last week with a
further patch to tighten up the language in the Notifications section.

Alex Benn=C3=A9e (7):
  README.md: convert html to proper Markdown format
  CONTRIBUTING.md: convert html to proper MarkDown
  LICENSE.md: convert html to proper MarkDown
  Makefile: add some simple make automations
  make-setup-generated: optionally add GIT metadata
  introduction.tex: introduce a glossary of terms
  content.tex: tighten up the definition of notification.

 CONTRIBUTING.md         |  22 ++--
 LICENSE.md              |   9 +-
 Makefile                |  26 ++++
 README.md               | 258 ++++++++++++++++------------------------
 content.tex             |   8 +-
 introduction.tex        |  21 ++++
 make-setup-generated.sh |  34 +++++-
 makehtml.sh             |   2 +-
 8 files changed, 194 insertions(+), 186 deletions(-)
 create mode 100644 Makefile

--=20
2.20.1


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

