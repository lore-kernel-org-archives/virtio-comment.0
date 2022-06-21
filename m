Return-Path: <helei.sig11@bytedance.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [virtio-comment] [External] [virtio-comment] [PATCH v4 1/1]
 virtio-crypto: introduce akcipher service
From: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>
In-Reply-To: <87k09a8fuu.fsf@redhat.com>
Date: Tue, 21 Jun 2022 18:36:59 +0800
Message-Id: <F86BE6AC-E3F9-4B9D-A654-7CBECAEF1EF5@bytedance.com>
References: <20220621100421.75356-1-helei.sig11@bytedance.com>
 <20220621100421.75356-2-helei.sig11@bytedance.com>
 <87pmj28gk4.fsf@redhat.com>
 <B0B1B7F6-E4C5-4510-955F-263EF47BF7F5@bytedance.com>
 <87k09a8fuu.fsf@redhat.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>, "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, Xin Zeng <xin.zeng@intel.com>, arei.gonglei@huawei.com, pizhenwei@bytedance.com
List-ID: <virtio-comment.lists.oasis-open.org>



> On Jun 21, 2022, at 6:34 PM, Cornelia Huck <cohuck@redhat.com> wrote:
>=20
> On Tue, Jun 21 2022, =E4=BD=95=E7=A3=8A <helei.sig11@bytedance.com> wrote=
:
>=20
>>> On Jun 21, 2022, at 6:19 PM, Cornelia Huck <cohuck@redhat.com> wrote:
>>>=20
>>> On Tue, Jun 21 2022, Lei He <helei.sig11@bytedance.com> wrote:
>>>=20
>>>> Introduce akcipher (asymmetric key cipher) service type, several
>>>> asymmetric algorithms and relevent information:
>>>> - RSA(padding algorithm, ASN.1 schema definition)
>>>> - ECDSA(ECC algorithm)
>>>>=20
>>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>>> Signed-off-by: Lei He <helei.sig11@bytedance.com>
>>>> ---
>>>> introduction.tex  |  18 +++
>>>> virtio-crypto.tex | 351 ++++++++++++++++++++++++++++++++++++++++++++++=
+++++++-
>>>> 2 files changed, 363 insertions(+), 6 deletions(-)
>>>=20
>>> Hm, there's currently a ballot running on v3... I assume you want the
>>> changes in v4 instead?
>>>=20
>>> Do you want to withdraw the ballot (and re-initiate voting for v4)?
>>>=20
>>=20
>> Yes, I want to re-initiate voting for v4. After the code was reviewed, t=
here was a little
>> conflict with the v3, so the v4 was pushed to make the protocol and code=
 consistent.
>> Is there anything else I need to do to?
>=20
> I did just withdraw the ballot, so nothing else from your side for now.
>=20

Thanks a million :-)

