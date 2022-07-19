Return-Path: <virtio-comment-return-3238-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 67FDA9864E3
	for <virtio-comment@lists.oasis-open.org>; Tue, 19 Jul 2022 03:08:48 +0000 (UTC)
Message-ID: <4092b565-859c-8095-bbd6-10be6f4e2c2f@bytedance.com>
Date: Tue, 19 Jul 2022 11:08:40 +0800
MIME-Version: 1.0
References: <20220621100421.75356-1-helei.sig11@bytedance.com>
 <20220621100421.75356-2-helei.sig11@bytedance.com>
 <87pmj28gk4.fsf@redhat.com>
 <6ae5062f-e839-23a6-d000-5b6fd82158f4@bytedance.com>
 <87r12iprq1.fsf@redhat.com>
From: Lei He <helei.sig11@bytedance.com>
In-Reply-To: <87r12iprq1.fsf@redhat.com>
Subject: [virtio-comment] Re: [External] Re: Re: [virtio-comment] [PATCH v4 1/1] virtio-crypto:
 introduce akcipher service
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>, mst@redhat.com, virtio-comment@lists.oasis-open.org
Cc: helei.sig11@bytedance.com, xin.zeng@intel.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

On 2022/7/18 =E4=B8=8B=E5=8D=887:47, Cornelia Huck wrote:
> On Mon, Jul 18 2022, Lei He <helei.sig11@bytedance.com> wrote:
>=20
>> On 2022/6/21 =E4=B8=8B=E5=8D=886:19, Cornelia Huck wrote:
>>> On Tue, Jun 21 2022, Lei He <helei.sig11@bytedance.com> wrote:
>>>
>>>> Introduce akcipher (asymmetric key cipher) service type, several
>>>> asymmetric algorithms and relevent information:
>>>>     - RSA(padding algorithm, ASN.1 schema definition)
>>>>     - ECDSA(ECC algorithm)
>>>>
>>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>>> Signed-off-by: Lei He <helei.sig11@bytedance.com>
>>>> ---
>>>>    introduction.tex  |  18 +++
>>>>    virtio-crypto.tex | 351 +++++++++++++++++++++++++++++++++++++++++++=
++++++++++-
>>>>    2 files changed, 363 insertions(+), 6 deletions(-)
>>>
>>> Hm, there's currently a ballot running on v3... I assume you want the
>>> changes in v4 instead?
>>>
>>> Do you want to withdraw the ballot (and re-initiate voting for v4)?
>>>
>>
>> Hi, Huck:
>> It looks like the linux kernel won't accept the ECDSA related patch at
>> the moment, let's re-initiate voting for v4? Do I need to start an new
>> issue on github?
>=20
> Ok, can you quickly summarize the state for me? Are we going with the
> version in v3 or in v4? I've lost track here.
>=20
> Please don't open a new github issue, just edit the existing one to
> point to the change you want to see included.
>=20
> Thanks,
> Cornelia
>=20

Here is the existing issue:
https://github.com/oasis-tcs/virtio-spec/issues/129

At first, we initiated a ballot with the v3 version but it didn't pass.=20
At the same time, I posted some patches to implement the v3 protocol.=20
Most of those patches have been upstream now, but after the review, the=20
code is a little inconsistent with the v3 protocol, so I posted the v4=20
and would like to use v4 to initiate the voting.

The link in the issue has been updated to the latest patch now.

Best regards,
Lei He
--
helei.sig11@bytedance.com


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

