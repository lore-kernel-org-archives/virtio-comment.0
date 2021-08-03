Return-Path: <virtio-comment-return-2134-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E00B19863C3
	for <virtio-comment@lists.oasis-open.org>; Tue,  3 Aug 2021 06:28:55 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20210802130043-mutt-send-email-mst@kernel.org>
References: <20210726165254.8529-1-mgurtovoy@nvidia.com>
 <20210728083306-mutt-send-email-mst@kernel.org>
 <f79c6f8f-04c7-3ca7-432a-b23e6eb09ce8@nvidia.com>
 <20210730032625-mutt-send-email-mst@kernel.org>
 <0bffb13f-4e88-266d-e072-bafa44ec86fe@nvidia.com>
 <20210731175617-mutt-send-email-mst@kernel.org>
 <8360728a-68e7-3727-be2c-20b3a259a633@nvidia.com>
 <874kc727pi.fsf@redhat.com>
 <738e1458-2a54-f534-df62-3be198487e91@nvidia.com>
 <20210802130043-mutt-send-email-mst@kernel.org>
Date: Tue, 03 Aug 2021 08:28:42 +0200
Message-ID: <87y29jyrc5.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [RFC PATCH v2 1/2] Add virtio Admin Virtqueue specification
Content-Type: text/plain
To: "Michael S. Tsirkin" <mst@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, stefanha@redhat.com, oren@nvidia.com, parav@nvidia.com, shahafs@nvidia.com, eperezma@redhat.com, aadam@redhat.com, bodong@nvidia.com, amikheev@nvidia.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Aug 02 2021, "Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Aug 02, 2021 at 07:03:11PM +0300, Max Gurtovoy wrote:
>> There is no much bits left in the generic feature field for all the features
>> we would like to add.
>> I mentioned only 5-6 in the above example and it will bring us to bit 46
>> already.
>> 
>> please think of 5-10 years from today.
>> 
>
> IIUC nothing prevents adding more once we exhaust 64 bits. IMHO it's actually
> pretty important to make sure the feature negotiation works well
> and covers relevant usecases. If we have limitations preventing that
> I'd like to at least try to fix that not replacing feature negotiation with
> something else.

I recall that we had a discussion about that years ago when we
introduced VERSION_1; we explicitly agreed that we can extend features
beyond 64 bit once we need it. (A quick search did not turn up that mail
exchange, though.)


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

