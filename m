Return-Path: <virtio-comment-return-2448-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 41D9298655C
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Dec 2021 17:59:51 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20211208040549.57531-1-yadong.qi@intel.com>
References: <20211208040549.57531-1-yadong.qi@intel.com>
Date: Wed, 08 Dec 2021 18:59:31 +0100
Message-ID: <874k7jt1to.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v5] virtio-blk: add secure erase feature to specification
Content-Type: text/plain
To: yadong.qi@intel.com, virtio-comment@lists.oasis-open.org
Cc: stefanha@redhat.com, hch@lst.de, luhai.chen@intel.com, kai.z.wang@intel.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Dec 08 2021, yadong.qi@intel.com wrote:

> From: Yadong Qi <yadong.qi@intel.com>
>
> There are user requests to use the Linux BLKSECDISCARD ioctl on
> virtio-blk device. A secure discard is the same as a regular discard
> except that all copies of the discarded blocks that were possibly
> created by garbage collection must also be erased. This requires
> support from the device. And "secure erase" is more commonly used
> in industry to name this feature. Hence in this proposal, extend
> virtio-blk protocol to support secure erase command.
>
> Introduced new feature flag and command type:
>     VIRTIO_BLK_F_SECURE_ERASE
>     VIRTIO_BLK_T_SECURE_ERASE
>
> This feature is a passthrough feature on backend because it is hard
> to emulate a secure erase. So virtio-blk will report this feature
> to guest OS if backend device support such kind of feature. And
> when guest OS issues a secure erase command, backend driver will
> passthrough the command to host device blocks.
>
> Introduced new fields in virtio_blk_config for secure erase commands:
> struct virtio_blk_config {
>     ...
>     max_secure_erase_sectors;
>     max_secure_erase_seg;
>     secure_erase_sector_alignment;
> };
>
> Signed-off-by: Yadong Qi <yadong.qi@intel.com>
> ---
> v1 -> v2:
> - add separated queue limits for secure discard.
>
> v2 -> v3:
> - reword "secure discard" to "secure erase".
> - adjust offset of new fields
>
> v3 -> v4
> - unify the wording to "secure erase"
>
> v4 -> v5
> - fix typo
> - adjust position of changelog
>
> ---
>  content.tex | 41 +++++++++++++++++++++++++++++++++--------
>  1 file changed, 33 insertions(+), 8 deletions(-)

Looks good to me from a purely spec point of view.

If nobody else has any comments, can you please open a github issue for
that? (https://github.com/oasis-tcs/virtio-spec#use-of-github-issues)


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

