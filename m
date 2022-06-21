Return-Path: <virtio-comment-return-3157-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2265A9863A8
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Jun 2022 10:24:37 +0000 (UTC)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
From: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>
In-Reply-To: <87pmj28gk4.fsf@redhat.com>
Date: Tue, 21 Jun 2022 18:24:30 +0800
Message-Id: <B0B1B7F6-E4C5-4510-955F-263EF47BF7F5@bytedance.com>
References: <20220621100421.75356-1-helei.sig11@bytedance.com>
 <20220621100421.75356-2-helei.sig11@bytedance.com>
 <87pmj28gk4.fsf@redhat.com>
Subject: [virtio-comment] Re: [External] [virtio-comment] [PATCH v4 1/1] virtio-crypto:
 introduce akcipher service
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>, "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, Xin Zeng <xin.zeng@intel.com>, arei.gonglei@huawei.com, pizhenwei@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>



> On Jun 21, 2022, at 6:19 PM, Cornelia Huck <cohuck@redhat.com> wrote:
>=20
> On Tue, Jun 21 2022, Lei He <helei.sig11@bytedance.com> wrote:
>=20
>> Introduce akcipher (asymmetric key cipher) service type, several
>> asymmetric algorithms and relevent information:
>>  - RSA(padding algorithm, ASN.1 schema definition)
>>  - ECDSA(ECC algorithm)
>>=20
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> Signed-off-by: Lei He <helei.sig11@bytedance.com>
>> ---
>> introduction.tex  |  18 +++
>> virtio-crypto.tex | 351 ++++++++++++++++++++++++++++++++++++++++++++++++=
+++++-
>> 2 files changed, 363 insertions(+), 6 deletions(-)
>=20
> Hm, there's currently a ballot running on v3... I assume you want the
> changes in v4 instead?
>=20
> Do you want to withdraw the ballot (and re-initiate voting for v4)?
>=20

Yes, I want to re-initiate voting for v4. After the code was reviewed, ther=
e was a little
conflict with the v3, so the v4 was pushed to make the protocol and code co=
nsistent.
Is there anything else I need to do to?
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

