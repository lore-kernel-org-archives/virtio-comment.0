Return-Path: <virtio-comment-return-3235-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 158F09863B5
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Jul 2022 11:47:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <6ae5062f-e839-23a6-d000-5b6fd82158f4@bytedance.com>
References: <20220621100421.75356-1-helei.sig11@bytedance.com>
 <20220621100421.75356-2-helei.sig11@bytedance.com>
 <87pmj28gk4.fsf@redhat.com>
 <6ae5062f-e839-23a6-d000-5b6fd82158f4@bytedance.com>
Date: Mon, 18 Jul 2022 13:47:50 +0200
Message-ID: <87r12iprq1.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: Re: [virtio-comment] [PATCH v4 1/1] virtio-crypto: introduce
 akcipher service
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Lei He <helei.sig11@bytedance.com>, mst@redhat.com, virtio-comment@lists.oasis-open.org
Cc: helei.sig11@bytedance.com, xin.zeng@intel.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jul 18 2022, Lei He <helei.sig11@bytedance.com> wrote:

> On 2022/6/21 =E4=B8=8B=E5=8D=886:19, Cornelia Huck wrote:
>> On Tue, Jun 21 2022, Lei He <helei.sig11@bytedance.com> wrote:
>>=20
>>> Introduce akcipher (asymmetric key cipher) service type, several
>>> asymmetric algorithms and relevent information:
>>>    - RSA(padding algorithm, ASN.1 schema definition)
>>>    - ECDSA(ECC algorithm)
>>>
>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>> Signed-off-by: Lei He <helei.sig11@bytedance.com>
>>> ---
>>>   introduction.tex  |  18 +++
>>>   virtio-crypto.tex | 351 +++++++++++++++++++++++++++++++++++++++++++++=
++++++++-
>>>   2 files changed, 363 insertions(+), 6 deletions(-)
>>=20
>> Hm, there's currently a ballot running on v3... I assume you want the
>> changes in v4 instead?
>>=20
>> Do you want to withdraw the ballot (and re-initiate voting for v4)?
>>=20
>
> Hi, Huck:
> It looks like the linux kernel won't accept the ECDSA related patch at=20
> the moment, let's re-initiate voting for v4? Do I need to start an new=20
> issue on github?

Ok, can you quickly summarize the state for me? Are we going with the
version in v3 or in v4? I've lost track here.

Please don't open a new github issue, just edit the existing one to
point to the change you want to see included.

Thanks,
Cornelia


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

