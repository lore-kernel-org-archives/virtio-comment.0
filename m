Return-Path: <virtio-comment-return-2490-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2630C986256
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Jan 2022 08:10:55 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220103164709-mutt-send-email-mst@kernel.org>
References: <20220103170344.3696-1-mgurtovoy@nvidia.com>
 <87mtkcwxaq.fsf@redhat.com>
 <20220103164709-mutt-send-email-mst@kernel.org>
Date: Tue, 04 Jan 2022 09:10:48 +0100
Message-ID: <87k0ffx6nr.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v2 1/1] Fix reserved Feature bits numbering
Content-Type: text/plain
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, virtio-comment@lists.oasis-open.org, oren@nvidia.com, stefanha@redhat.com, eperezma@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jan 03 2022, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Jan 03, 2022 at 06:20:45PM +0100, Cornelia Huck wrote:
>> On Mon, Jan 03 2022, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>> 
>> > This should have been updated during VIRTIO_F_NOTIFICATION_DATA,
>> > VIRTIO_F_NOTIF_CONFIG_DATA and VIRTIO_F_RING_RESET standartization.
>> >
>> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> > Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
>> 
>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/128
>> 
>> Can you please also update the archive link in the issue, once the mail
>> shows up there?
>
>
> Wish we had a cleaner way to do it than updating this each time we
> add a generic feature bit.

Indeed. But let's just go with this fixup until we come up with a better
way.


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

