Return-Path: virtio-comment-return-841-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 43E7F985B2F
	for <virtio-comment@lists.oasis-open.org>; Tue, 20 Aug 2019 12:01:56 +0000 (UTC)
From: Yoni Bettan <ybettan@redhat.com>
Date: Tue, 20 Aug 2019 15:01:42 +0300
Message-Id: <20190820120144.108598-1-ybettan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH V4 0/2] Added building instructions to README.md
To: virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, stefanha@gmail.com, ehabkost@redhat.com, ailan@redhat.com, Yoni Bettan <ybettan@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

V3 -> V4:

    - Changed the fonts to liberation fonts only if 'Arial' and 'Courier
      New' fonts are not available otherwise stick with the original fonts.

V2 -> V3:

    - Changed the fonts to liberation fonts
    - Added building instruction for OSX user

V1 -> V2:

    - Added building instructions to README.md

Yoni Bettan (2):
  Changed fonts to freely-available fonts when built locally.
  README.md: Added building instructions.

 README.md        | 28 ++++++++++++++++++++++++++++
 commands-pdf.tex | 12 ++++++------
 virtio.tex       |  4 ++--
 3 files changed, 36 insertions(+), 8 deletions(-)

-- 
2.21.0


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

