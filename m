Return-Path: virtio-comment-return-1440-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9A83C985EC1
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Sep 2020 20:58:29 +0000 (UTC)
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed,  2 Sep 2020 13:58:23 -0700
Message-Id: <20200902205825.2055-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 0/2] Blob resources v6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Latest blob series with clarification around mutliple mappings.  Will
create Github merge request after a few days, now that
RESOURCE_ASSIGN_UUID has landed in the spec (thanks mst@!).

Gurchetan Singh (2):
  virtio-gpu: add resource create blob
  virtio-gpu: add support for mapping/unmapping blob resources

 virtio-gpu.tex | 171 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 167 insertions(+), 4 deletions(-)

--=20
2.26.2


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

