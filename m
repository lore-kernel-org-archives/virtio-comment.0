Return-Path: <virtio-comment-return-2912-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0A7939864DC
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Apr 2022 08:32:51 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <dafc9518-ef57-f659-14b1-b14890017f46@amazon.com>
References: <20220322094940.3486-1-lauralg@amazon.com>
 <CAGxU2F5EtepBLC9XzjHk+Rgz70PErnA7hqfLbMJ0K5gH1FU6Qw@mail.gmail.com>
 <dafc9518-ef57-f659-14b1-b14890017f46@amazon.com>
Date: Wed, 06 Apr 2022 10:32:46 +0200
Message-ID: <878rsifw7l.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] vsock: add documentation about len
 header field
Content-Type: text/plain
To: Laura Loghin <lauralg@amazon.com>, Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Mar 29 2022, Laura Loghin <lauralg@amazon.com> wrote:

> On 3/28/22 14:09, Stefano Garzarella wrote:
>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>>
>>
>>
>> Hi Laura,
>>
>> On Tue, Mar 22, 2022 at 10:50 AM Laura Loghin<lauralg@amazon.com>  wrote:
>>> Signed-off-by: Laura Loghin<lauralg@amazon.com>
>>> ---
>>>   virtio-vsock.tex | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>>> index d79984d..e32cad8 100644
>>> --- a/virtio-vsock.tex
>>> +++ b/virtio-vsock.tex
>>> @@ -107,6 +107,11 @@ \subsection{Device Operation}\label{sec:Device Types / Socket Device / Device Op
>>>   #define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
>>>   \end{lstlisting}
>>>
>>> +\field{len} is the size of the payload, in bytes. However, the driver may
>>> +provide buffer(s) for the payload that have a total size longer than
>>> +\field{len}. If that is the case, only the first \field{len} bytes MUST be
>>> +used for the actual data.
>>> +
>> IIUC MUST and friends are for normative sections, so I would remove
>> the last sentence.
>
> You're right, I'll remove it. It should already be clear enough only the
> first len bytes need to be used for the payload.

Another option would be

"However, the driver may provide buffer(s) for the payload that have a
total size longer than \field{len}, in which case only the first
\field{len} bytes will be used for the actual data."


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

