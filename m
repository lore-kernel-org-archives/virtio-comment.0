Return-Path: <virtio-comment-return-6338-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EA5EB64DA
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 21:54:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6F37160086
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 21:54:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 57EA498665E
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 21:54:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 402E5986603; Tue, 13 Jun 2023 21:54:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2C72B986630
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Jun 2023 21:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nr7ta37f+apBgqB8U0HNSCwVU9X+VP18+qgdwy3TwL4LG/ijqPdWVfg5ml+MVMtfZQ9Gd7sreKiw4muMqlNHNpf1o9H5FD2e8DiKIcrFl2KObaIOEzrzkusK22tEy+9e4T8rOMDVGUowzG2BT83b8+56dxytivTkpiHsSOHw9ZrIeyXYzdvGkU9ylGGt+r25iK59gwoqZ5GZxbmjOP9/laQzFRZ3mACRwUndaDyA2ff3IkVLiG8I5fiE/fzjEbwYtgJ8rKaiHAn1b1AZeUvLPL+ZJFAWmP34SnfJYveXe9PIXgNBeP1ylFQtBcuivUUeaEKAa+LcLCUNVXSODr9Ewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3WULoKrfFzCNA9zQ0wb+PQRAlPBMLys1NvKdACrpWx8=;
 b=Bv3v+jqbhwDRXJRs26TCeAaS3/4gOIuZD3UzHAJle0dBMgXvkk/fCyNBmSrzLFZPsExefkE+XJNqiRYioKJtFpze0bQueez2ROYEk+WeA9lTKdxWuUbgSDENJaZITxyHoXzYV1/2H2755C/sLKdwjletc8vQ78OvqCkATvazHKYUAqZk9m/vePtz8ILF5AFEtXsZwT2YJC+urxj5vJaalyohpWgkR+GyVIrKjS5Af8x6jypPoHlVzUoTexjBALkKL5lzSjjjaInVEfZzZlqpu9GlLK8svO41dtfkMWRxNf2a/ZcWxZHFvNX/wPc/XQC+XChdPxFSWdIVjdfVktt6YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Eugenio Perez Martin <eperezma@redhat.com>, Jason Wang
	<jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "alvaro.karsz@solid-run.com"
	<alvaro.karsz@solid-run.com>, Liuxiangdong <liuxiangdong5@huawei.com>, Gautam
 Dawar <gdawar@xilinx.com>, "longpeng2@huawei.com" <longpeng2@huawei.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, Stefano
 Garzarella <sgarzare@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>, Zhu
 Lingshan <lingshan.zhu@intel.com>, Shannon Nelson <snelson@pensando.io>, Max
 Gurtovoy <mgurtovoy@nvidia.com>, "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>
Thread-Topic: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling
Thread-Index:
 AQHZmQIKC76R9PwpeEiJOopOzuw0Y69/AFOAgAAG9gCAAANtAIAAC8qAgAC0TYCAAEgAgIAAWXEAgAAKwgCAAAn2gIAAFZ2AgADi94CAAM6QAIAAWzcAgAQxloCAAY9dAIAAAd0AgAAnCoCAAJHBEIAAEOUAgAATmKCAAAwbgIAAALkg
Date: Tue, 13 Jun 2023 21:54:45 +0000
Message-ID:
 <PH0PR12MB5481CBCA2D51F3B67581C100DC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230608180617-mutt-send-email-mst@kernel.org>
 <CAJaqyWf-=R+KHfBjzrGzkunTdeV8sAgFUv_kYoxNo3uqH2OOSw@mail.gmail.com>
 <20230609115250-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
 <20230613034216-mutt-send-email-mst@kernel.org>
 <20230613035132-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
 <PH0PR12MB5481746BE0C1B7CE4D098A7BDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230613154823-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F91C70744E7A83BD10ADC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230613173837-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230613173837-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL3PR12MB6570:EE_
x-ms-office365-filtering-correlation-id: c326dd19-8b4a-424e-11eb-08db6c58ccd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 EQdoPtZJX7ZE/PDIUwmfaWWKi6anWJuKzCo5YAkmDHAfrzcPoXweW5m+JbklzmUAN2OWxuHr7vqDATQqA4h4K9eDYXUxNy521xKYa6heJK3/+Y3HX5yqk4G+JR/XhNjCT3FTDLga+KnCJ4eOkthN1gfue11XjFYyGCeCMDNWOq358wvTZKRZqW/In36ET3imef2bQvOrAy0PZlx0mZFiC4po7ek3zZCQm7kZJE2+L5Du4cBgDf5mU3zC9if2YlY40IrmGuxWgbn046wXXmtmy0PeIEfIQU/MJIkG1471hREx4doN/IQJXZKQcbJWOFeBs438b8mhOqUmaIPgjeg923dHhvcdIrjK3gNB1MRiCAo6UGRvPhCzuzhWaZDwn8hMsqHKgHlnSJzxlfYpAPECumCTqF8+EyvFOHJ8SYB26dzW2UUxWx+ev5rherzvgdQbXf4zGtty6XaBiM5ac8REFQ/4FITs4cXvR6NFXe3yH3Uz9K5V5doWLSDCPwIyW0YYR+7SEi7KFiPkVJdT1Uhq9zgEILoNOT10KX16RX8c6+u4LjmKYoIImw3pf5Kko4ZCDTijkCG9kf66vjkrQBEbCVEc0zb+OMQ99eVUHQbVjtq5Fs9ikq319yi+EFFHH18N
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199021)(64756008)(66446008)(66556008)(66476007)(66946007)(71200400001)(76116006)(316002)(6916009)(4326008)(54906003)(478600001)(33656002)(86362001)(38070700005)(6506007)(26005)(9686003)(186003)(2906002)(5660300002)(8676002)(52536014)(8936002)(7696005)(55016003)(7416002)(41300700001)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gdJoT240BB8/8pg8sKheSo3oR9KYV4NkglS29gsa/n5Rj9a9lBTBb+TTVioI?=
 =?us-ascii?Q?skxc/2JbEFVfHMqrLWKYqhypd4coT9hceiCOl9BU2d9lZ0mGD9TM6HfKsfJf?=
 =?us-ascii?Q?0Vuvm/XWJVhrR/D3de8i1Bw2BnvQyywzOKJQviVCcXrkuUkTd+uCOCLkFNjM?=
 =?us-ascii?Q?5TZa32QhAtucES0CuPaU7KZ/OChU4RMj6Iy9oDf52O9UlmXNqi88EQsnPAD4?=
 =?us-ascii?Q?UjbZhwaWSxO1d7Mi7rJYQRiLkyma9ZVRgqOxUeubse4jKLVpbgu98t4akbDV?=
 =?us-ascii?Q?/8NW1oPBaPH7HEHCvDtnuXjrQXfDo5oakM90V5z5nkG8nUnMaq9ivR0o8tv9?=
 =?us-ascii?Q?3vMwCEPa4CzQV4SeG+5zyJaSxxFLY7LOzUxgMtcAWYUUSpIxz9mv1r6nto/I?=
 =?us-ascii?Q?rVx5doSVxtJLEMpC5uv8LF4ENRNLRo41GMxX003XgTqy+3jwXmG0R8uRVZ0H?=
 =?us-ascii?Q?twrnM4MNpUchqVgoqEshzbkec+OiSI1kWiK5IX54jfoAhMdRGYhg2yV4k/6s?=
 =?us-ascii?Q?Z1dYea/Fw08tl06FRnDFRrcA3iehpJg1WpkIEj7J/jTQwpkS5qtsrnvyAGqa?=
 =?us-ascii?Q?AIza0A2woP6NMBG8GBB9WfBGS/9FRfZhKz4AbUi50kagGintpxz+J9FFfa18?=
 =?us-ascii?Q?LsdUJHst8VcdBP9tmjvigqv7aQ87sTndSjNfyK5cTYneORNKsu73djrMYqc2?=
 =?us-ascii?Q?GbXuLwadqHHabfbTswVC5z7bXuwkZyJtO9ZzVsNArLw+K50swXa3Q5mSbogr?=
 =?us-ascii?Q?BeRo84IPM11ewxdbVchuRoU5pNZfV7BlQDbwHL3MVKwwdtILt/xj2oXLhZEF?=
 =?us-ascii?Q?fMFmSBQmLHaZ6lqaQs0qE31DVxiqG6NnUDw6fPq24hyquP3cznW7O6mxjgRH?=
 =?us-ascii?Q?aOofFRSAiLXMIl35G/omSrsBkzdFkl9QeV/r1H/4HzG/24A16igmWEGHux0J?=
 =?us-ascii?Q?uro9xXApyUgBCGjf71y1vnapzn/g7wCke4U3CCEqGepmr0UMExKHry7u/7xt?=
 =?us-ascii?Q?KygOiy0Ox8elF8PU2/qGJQ/ucORWEYRFIQpJnYc0ZsvzPIGeKuhtfQvGvSrT?=
 =?us-ascii?Q?uQq8NqoOOQxiDR0LZFlyV8zHMWsWA0weZT1lr9WC9LXTwsjehw4k2T3CUgzc?=
 =?us-ascii?Q?W2RiFscRq/oazuYMtaNwR5ZXeMTu5tq+mcsKc8DkezlcCH7TYCHJVtGSib3w?=
 =?us-ascii?Q?TehG3bY/sy+xTz0tkXmgA8YxZeCj2Z0fwhVWIeumaVjjk26qjXzJWxR+WlnQ?=
 =?us-ascii?Q?wPp+zWeDave4Rd9vjlrKHSN3ul+oXptArxidKP2qSlON8nTsmUcfHefuIXR9?=
 =?us-ascii?Q?yDJXffaTrb0mGw55bfaQjGbm1LOpda2C3Zrgdg9rxV6UsO6IUey//b9B6L8n?=
 =?us-ascii?Q?0EBBlbgtkddJfWh/zfr75jAF+ZvOfs6yB3V1hmsteLreh2W2yZiQ9To1pGs+?=
 =?us-ascii?Q?X0HqwQMvtTeuN9dOS5Lq5QjuQPLTRefkOlKGGuARGXBxg7MnhIzufGUVJSkB?=
 =?us-ascii?Q?gcyymexehSSvGsvikt+1BuvU6kH/gg+aDSggarzaJwDLCagGiYeRhzk365ur?=
 =?us-ascii?Q?Ch5THsaGxSPnWTbe4W0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c326dd19-8b4a-424e-11eb-08db6c58ccd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 21:54:45.1968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LwIVDZ0TMw9IE9yqsZjgWtuEf6x3f00HgnO118Uxlc1mDLaG8T1yaS27nqMEhyo5ZtHtyeoSzVvT9rqjQlRyqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6570
Subject: RE: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, June 13, 2023 5:48 PM

> > Why queue_reset is needed here?
> > I don't see spec saying that queue_enable must be done only once for a =
given
> Q before DRIVER_OK.
>=20
> I see you found it.
>=20
> > > - program another queue address, size
> > >
> > > Finally we are decided, let's start operating:
> > >
> > > - DRIVER_OK
> > >
> > >
> > > I don't see how it's possible with just queue_enable.
> > >
> > >
> > > >
> > > > It is not explicitly mentioned in the spec that one can setup the
> > > > queue using
> > > queue reset instead of queue enable.
> > > > As Jason mentioned it is implementation specific, one device
> > > > supports it and
> > > one doesn't.
> > > > Hence, it will break on those devices which doesnt support it.
> > > >
> > >
> > > Setup? No, and spec explicitly says to setup one has to use
> > > queue_enable. But this is not what we discussed with Stefano here.
> > >
> > The above sequence you described is not well documented.
>=20
> It's the standard sequence for queue reset, is it not?
>=20
> For example:
>=20
> 	Virtqueue reset is divided into two parts. The driver first resets a que=
ue
> and
> 	can afterwards optionally re-enable it.
>=20
>=20
> it seems clear that queue has to be enabled before being reset.
>
Yes, it is clear.
=20
> I'm not sure what's broken.
>
If a device has assumed that queue_reset must be done after DRIVER_OK stage=
 because until that point the device is not "live",
Such device needs the fix.

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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

