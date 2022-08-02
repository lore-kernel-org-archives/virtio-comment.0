Return-Path: <virtio-comment-return-3292-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 514C09864A6
	for <virtio-comment@lists.oasis-open.org>; Tue,  2 Aug 2022 13:18:58 +0000 (UTC)
Message-ID: <e4389ceb-68f3-d241-d874-06757cba4ac9@intel.com>
Date: Tue, 2 Aug 2022 21:18:53 +0800
MIME-Version: 1.0
References: <20220801093216.362119-1-lingshan.zhu@intel.com>
 <20220801165438-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20220801165438-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] Re: [PATCH V2 0/5] Introduce virtio transport
 virtqueue
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>



On 8/2/2022 4:56 AM, Michael S. Tsirkin wrote:
> On Mon, Aug 01, 2022 at 05:32:11PM +0800, Zhu Lingshan wrote:
>> This series introduces virtio transport virtqueue as a new
>> transport layer for virtio devices.
>>
>> This series defines the concepts of virtio management device
>> and virtio managed devices.
>
> Overall I'm happy with the progress made here. Pls keep iterating.
Sure, will do, thanks!
> I would like to see whether we can unify this with the admin
> queue work somehow. The technology is different (SIOV vs SRIOV)
> but there are also similarities.
>
> Do you care to review some patches from the admin queue proposals maybe?
IMHO, I think this transport vq series focus on introducing a new virtio=20
transport layer for
hyper scaling, like SIOV. And the admin vq proposal looks focusing on=20
administration, to control
the sub-devices. so maybe the transport vq and the admin vq are works in=20
parallel.
>
>
>> This series also defines a commands set over the transport virtqueue,
>> including:
>> The command to query available resources of the management device
>> The commands to create / destroy the managed devices.
>> The commands to config the managed devices.
>> The commands to config virtqueues of the managed devices.
>>
>> Changes form V1:
>> 1)Add a command to set per-vq asid(Jason)
>> 2)Add a command to reset a virtqueue(Jason)
>> 3)Add support for packed virtqueue state(Jason)
>> 4)Allow nested managed devices(Jason)
>> 5)Provides device feature bits in the provisioning(Jason)
>> 6)Removed most of the error codes, only left OK and ERR(Jason)
>> 7)=E2=80=9Cvirtual devices=E2=80=9D is renamed to =E2=80=9Cmanaged devic=
es=E2=80=9D, to be more general(Jason)
>>
>> Zhu Lingshan (5):
>>    Introduce virito transport virtqueue
>>    Introduce feature bit VIRTIO_F_TRANSPT_VQ_MDEV
>>    Introduce the commands set of the transport vq
>>    Describe the process to present a managed device
>>    Add transport vq number for virtio blk and net
>>
>>   content.tex      | 784 +++++++++++++++++++++++++++++++++++++++++++++++
>>   introduction.tex |   3 +
>>   2 files changed, 787 insertions(+)
>>
>> --=20
>> 2.35.3
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


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

