Return-Path: <virtio-comment-return-2926-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 759BC9863AD
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Apr 2022 14:32:53 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <ef8ed5a1-56ae-9527-0433-09025b2f484a@amazon.com>
References: <20220407081330.17553-1-lauralg@amazon.com>
 <87a6crbua8.fsf@redhat.com>
 <ef8ed5a1-56ae-9527-0433-09025b2f484a@amazon.com>
Date: Mon, 11 Apr 2022 16:32:47 +0200
Message-ID: <874k2zbshc.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v3] vsock: add documentation about len
 header field
Content-Type: text/plain
To: Laura Loghin <lauralg@amazon.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Apr 11 2022, Laura Loghin <lauralg@amazon.com> wrote:

> On 4/11/22 16:53, Cornelia Huck wrote:
>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>>
>>
>>
>> On Thu, Apr 07 2022, Laura Loghin<lauralg@amazon.com>  wrote:
>>
>>> Signed-off-by: Laura Loghin<lauralg@amazon.com>
>>> ---
>>>   virtio-vsock.tex | 5 +++++
>>>   1 file changed, 5 insertions(+)
>> Reviewed-by: Cornelia Huck<cohuck@redhat.com>
>>
>> I guess that needs an issue to be included in 1.3?
>
> I already openedhttps://github.com/oasis-tcs/virtio-spec/issues/137, is there anything else I should do?

The patch should have

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/137

in it (no need to resend, we can include that before pushing as long as
it sits in a reply to the mail); also, please update the issue to point
to the v3 patch.

[We still need to open up the 1.3 branch after some editorial stuff has
been done; then we can hopefully flush the queue of outstanding issues.]


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

