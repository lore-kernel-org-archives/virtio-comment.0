Return-Path: <virtio-comment-return-2256-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 095E39864EA
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Aug 2021 02:13:19 +0000 (UTC)
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 25 Aug 2021 19:13:11 -0700
Message-Id: <20210826021313.378-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH 0/2] Context init virtio-gpu spec
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: kraxel@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

Here's the virtio spec change for context init.  The first patch
clarifies existing features, and second patch adds the new features
outlined here:

https://lists.freedesktop.org/archives/dri-devel/2021-August/320913.html

Gurchetan Singh (2):
  virtio-gpu: clarify spec regarding capability sets
  virtio-gpu: add context init support

 virtio-gpu.tex | 133 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 120 insertions(+), 13 deletions(-)

--=20
2.31.0


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

