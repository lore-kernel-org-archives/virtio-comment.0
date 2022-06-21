Return-Path: <virtio-comment-return-3158-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A84899863A8
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Jun 2022 10:31:58 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <CAJs=3_D0Ou99btHFm7_1LHk+7FCdWnbKZCrzS5Ypj1sityVCBQ@mail.gmail.com>
References: <20220615143916.3563008-1-alvaro.karsz@solid-run.com>
 <87v8su8hzc.fsf@redhat.com>
 <CAJs=3_D0Ou99btHFm7_1LHk+7FCdWnbKZCrzS5Ypj1sityVCBQ@mail.gmail.com>
Date: Tue, 21 Jun 2022 12:31:54 +0200
Message-ID: <87mte68fz9.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v7] Introduction of Virtio Network
 device notifications coalescing feature.
Content-Type: text/plain
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Jun 21 2022, Alvaro Karsz <alvaro.karsz@solid-run.com> wrote:

>> Note that we are currently voting on
>> https://lists.oasis-open.org/archives/virtio-comment/202110/msg00010.html,
>> which uses feature bits 54 + 55, so this would need to pick another
>> one. No big deal, though, as we still have spare bits until we reach
>> 50. [Should we need to go to the range above 63, IIRC at least PCI would
>> need a tweak to support more than 64 feature bits, but that's not urgent
>> yet.]
>
> Do you want me to create a new version with a different bit?
> Or should I wait a little longer for comments/ack from a member who is
>  more familiar with virtio-net?

I think it would be best to wait for a review from the virtio-net folks;
the bit is easy enough to change.


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

