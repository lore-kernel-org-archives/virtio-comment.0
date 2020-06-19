Return-Path: virtio-comment-return-1327-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F25C5986132
	for <virtio-comment@lists.oasis-open.org>; Fri, 19 Jun 2020 20:50:04 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Fri, 19 Jun 2020 21:49:54 +0100
Message-Id: <20200619204959.7877-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH  v2 0/5] some tweaks to the document build process
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,

So this is a re-spin of the series I sent earlier this year. I cut out
all the radical trimming of changelogs and automation of the version
stuff. You can still do a local build which will annotate the files
with some version data which will hopefully help with draft copies.

I've converted more of the htmlised markdown boilerplate into pure
markdown. The text itself is unchanged.

The makefile automation is mainly for my benefit - it just makes it
easier to hit C-c c in emacs and trigger the compile-command. I
realise this isn't useful for everyone so feel free to drop if it is
an over imposition.

Alex Benn=C3=A9e (5):
  README.md: convert html to proper Markdown format
  CONTRIBUTING.md: convert html to proper MarkDown
  LICENSE.md: convert html to proper MarkDown
  Makefile: add some simple make automations
  make-setup-generated: optionally add GIT metadata

 CONTRIBUTING.md         |  22 ++--
 LICENSE.md              |   9 +-
 Makefile                |  26 ++++
 README.md               | 258 ++++++++++++++++------------------------
 make-setup-generated.sh |  34 +++++-
 makehtml.sh             |   2 +-
 6 files changed, 168 insertions(+), 183 deletions(-)
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

