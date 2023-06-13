Return-Path: <virtio-comment-return-6335-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3167EB64D7
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 21:09:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F114D1318C7
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 21:09:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DA74198663D
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 21:09:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C69B3986591; Tue, 13 Jun 2023 21:09:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B29EB9865C3
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Jun 2023 21:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOtVBZPB26XcoqrLUu/X5Z5onZh9m5dXYJVB2vmJ2cFslXVrvcUUQk5uPmWTjK0QKPYpkGg7dDiQ2hEcyLFnBtz0PZCaeH5FnS9oxD/Zc2EnvbSkSx9fUbkU72HXCoXkoC0/+ejpZgPHGgkNUkX1zkMCd0uY0DxYHOXxgmi2AMpND3II8P62qlKcgMKXA7VNTZ/tt+OoJ6dNgHdRVfkxKRKFbH7YcR4cjK5su9t14+sfC0xyNrXL/vGhrDH8sPIW0izytIVehq9XxSn7Vipoe98g91BlJlUYdBHHIgzKP2u+aWPdh4ODg18mAHe269+PFQ9IL1elw9sRmo/OXK4RuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ug3CKL49poLLkUPGETRks6mcoPqJKcqlPKlGtCcpYi4=;
 b=WWUAPRKBwd2w7hL0WxhCgPNTDq0C7O1aDkO1Qad9vRfsEivhLXe/py+wygwqsbsB9zoejA9B1OYuhgfJhoNpqR2fI/T0gZBNRQkM/9hyrJ5heGKEs867hso6RxRCmeZKw53dZXQ41F13572o8pyi5Dx8nVvuTJmW9X0lmQU1inQ90uS8llUi6Af2e7zeG9ek3Um5WEJ9mu1x8GIBEAxXqswV8hCuGsX+etrJNoX+Z2GEx4TnuRv0+biEE1QGAFjqzv/6NS5bmhegtKFhJNY9bALTwc+l3JMa2gxpZpNODs2gWIDPcRlLuhMxczoMizRL29l5LMPnW2ypqLw7myMwbQ==
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
 AQHZmQIKC76R9PwpeEiJOopOzuw0Y69/AFOAgAAG9gCAAANtAIAAC8qAgAC0TYCAAEgAgIAAWXEAgAAKwgCAAAn2gIAAFZ2AgADi94CAAM6QAIAAWzcAgAQxloCAAY9dAIAAAd0AgAAnCoCAAJHBEIAAEOUAgAATmKA=
Date: Tue, 13 Jun 2023 21:09:05 +0000
Message-ID:
 <PH0PR12MB54811F91C70744E7A83BD10ADC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230608031325-mutt-send-email-mst@kernel.org>
 <CAJaqyWf+vn06NHcQY208dwyB=WH3PQ3A7z53o0BTy102XrT+3Q@mail.gmail.com>
 <20230608180617-mutt-send-email-mst@kernel.org>
 <CAJaqyWf-=R+KHfBjzrGzkunTdeV8sAgFUv_kYoxNo3uqH2OOSw@mail.gmail.com>
 <20230609115250-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
 <20230613034216-mutt-send-email-mst@kernel.org>
 <20230613035132-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
 <PH0PR12MB5481746BE0C1B7CE4D098A7BDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230613154823-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230613154823-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5269:EE_
x-ms-office365-filtering-correlation-id: 50a9a715-e935-4b2d-0275-08db6c526be4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 q79VbyW2NNS1PoHXlY1VclDaEm1nqBBt1Vsjtq4wd4CPosq0gxVwNGbxJd4yt40V3r+naawOxNkpz1KXpq+bziMhRHs2JN4H1MCwXAaiFw8GYIIdIO5Uhg/l91U2NLE2L/ppmM+CMFJqtWZfW6DDR02HlL6EHBp5DBiy8ceHc/wKBc/pkeUuXPAXd3RPuocRzQlWUNT7dzINg62Xsq5S4hJjKm64w8eo7vEAmBJQohYD7zYE5T19tTW+o500j+S0FlcAEQWroWUwC6/Gw+NRPA6jMFwkTDnP00E+C02fjT0M+qnjE2Q6BvOG2+sUqY7AAm9LqzChkFhcUz5LoOEepzwF2y3PnbUD+n8D8gzmy4rJAD37IFwZQAjUrohVhcwKFggLst62bKE4VhvDmXfstWLu3d035QwHkLFt3ANwgfOvi9l2USetciu5XKTFnH+schy7ph5Z9F3egQ57ygZFXRg7vjeLUe++2nBhfwH8Bbkb5X7FFe02wbrrwYac/4StRy1rpND9glUKqMhC5wKQNv9a5zJ2AEsidhxTh3FUsqANcauNmiLTPpGvHLuZSL3+Ug2/RxAtcS9NI6oHF26eiEwUXUQ4i0NGf/jnhhcmrFAt53DlqCiE3Hciv0oCRK1p
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199021)(7416002)(66446008)(66476007)(4326008)(66556008)(64756008)(66946007)(6916009)(76116006)(41300700001)(316002)(54906003)(52536014)(8936002)(8676002)(2906002)(5660300002)(71200400001)(7696005)(478600001)(55016003)(26005)(9686003)(186003)(83380400001)(33656002)(6506007)(122000001)(38070700005)(38100700002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?90QSGC0EDitTJPKM4ZXbjrJF4GTbilzg8G2wgfLxAAy9ZdoUM/Qf0W3lIlJ6?=
 =?us-ascii?Q?Hm7UrQpv69AwfaXGgTlC+9L8sgwhWDWk/3tXxTXaLqWaG0BwGo0Y+s0XiRv1?=
 =?us-ascii?Q?itoF8Tjs74UMvmVfxn6CUmD2Zq8fclrvYozVfMlsNjie61N/PcPbHfIwL6xp?=
 =?us-ascii?Q?TTe20D3Hulg4W4Boizt6PIQN47BX97+s/LdNkXOjV268DU3E9BP52TICbfXR?=
 =?us-ascii?Q?tOU5luSWHgo4Ba2SdSre46HCb2rpJc3qsiQkzWLZXisHcyhRKIjle3k4TJQn?=
 =?us-ascii?Q?d6z7LKp3+7PngYkVrNmuC6hrAP98/fI/HQRD6rGdwFqqa2ZyntVnkDvEtXLF?=
 =?us-ascii?Q?M1D6Tszd/Q2b6qXLXHHHy1hicHWH1lsJGGM0RW9H6GpF78GgvPyhZT+ffcCI?=
 =?us-ascii?Q?UniuCHjNCD5EXrOctEdcweCiTnmZarfuPb1jgu7NJtvFqMSzwIqMj3TYK8pE?=
 =?us-ascii?Q?kyE7kZsv/8/UkMAuXcismhpGdwSisBLmupnzXssyLSjK+gcwnseSCPtFwXwi?=
 =?us-ascii?Q?wFpMOEy3EkYwXo+ZCn4sFs7YbmSXl5nUCbUNDmkJQ9+WHZ6MzAnewq3Emz20?=
 =?us-ascii?Q?7aA0T/7d+OvXoaVR09We//DghnF+qJNQ8uuWmjz9bVzrm7mbn7hz2PyAyQ5b?=
 =?us-ascii?Q?cC78iNFrkmlGaxW7C+q/fPQopWm5MeY3eYyq92fvYuCwbDRg5NizQU5Jfey1?=
 =?us-ascii?Q?hngv2cjzd8st2h09EmcV7/Tl5DaGKl+Cnugm+udfMHopl6zzNME1C0YhsTuY?=
 =?us-ascii?Q?D0QiU1G8puxZLavHJRU+qHEflO/ssUkL5OcdEVIP/t0+OP2UnZTAnF36OIOT?=
 =?us-ascii?Q?uRyvdMeBdQghbAAafb2W6N+RVfBdUz0uoxd0YGD4icCH5xXrF9L51IgXCBEU?=
 =?us-ascii?Q?BW/9U2Q9W1i8N/1ZwDWX258awT5UtVtt1AzP5kZVk5TeM/MKimglQ3/qxbZE?=
 =?us-ascii?Q?JPaWyToIOp7SugAsqsTQkLm1CJnDTqQiT6m5f+SW72J+E0g0bj8wTr2cvq1f?=
 =?us-ascii?Q?HmBXT0RkG3TqxyhVEPq5KJcS1Ib/cKhqsmDBJJNVMdZOBq6+6nI3pOLwJFFI?=
 =?us-ascii?Q?l7T0jrPgP+Ex1DaTdhJQ743v+Kig051yn2NfGdQsGfF7Vmie8qvtBv/CLzbQ?=
 =?us-ascii?Q?JIMarRFEp4ziv3I8GeESzbff4tgCL31OvXwR1yHgXCPeYVDIABSnfq3kobxv?=
 =?us-ascii?Q?E5pMAPA0gAOM8LXvY/skiP02EtfjUj2mhKsd6TSss7z2N5ZJMytRidvrocFF?=
 =?us-ascii?Q?S0m0KwO5IDqAqREWKnIOQsX2h9kqHcxaIbV3YICFSvozIOT/UhD6GB6SgiZ2?=
 =?us-ascii?Q?c8dl5NeC1xUj4wZAxIqbtckXcippHDXOuOofcy/+Jmn3671aJEIt6Z9zVFle?=
 =?us-ascii?Q?ReiaY3fjKAVFZ2CBqpgC2gYr38J0tpknXzIKy1/6/V+Bz4p7FHSJTncVfbaN?=
 =?us-ascii?Q?GvkcpAe95QNI40jWqd0UPUhYeEOx1g8nM32z3xW+ZNRnmYdbHTMgb+p0xJij?=
 =?us-ascii?Q?kolT+VS8oC1A8PeRGlplgWDV9YPaEu1W88izt24OdBKIcdIWMwks72xWvgBY?=
 =?us-ascii?Q?L0lped/qngFF+YoKHEk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a9a715-e935-4b2d-0275-08db6c526be4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 21:09:05.6122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SiM+6FWrTkNI/kaeLzbDlO0MTP6fynQNP6zHKaR1kYp81YjG77NyWPik/kuTHmyd+o0iF15YI+mEUX2Iq2Jfsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5269
Subject: RE: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, June 13, 2023 3:55 PM
>=20
> I do not get how.  Let's make sure we are talking about the same thing.
> This is what I am saying:
>=20
> Start operating:
>=20
> - program queue address, size
> - queue_enable
>=20
> Now we change our mind about queue size or address. So:
>=20
> - queue_reset

Why queue_reset is needed here?
I don't see spec saying that queue_enable must be done only once for a give=
n Q before DRIVER_OK.

> - program another queue address, size
>=20
> Finally we are decided, let's start operating:
>=20
> - DRIVER_OK
>=20
>=20
> I don't see how it's possible with just queue_enable.
>=20
>=20
> >
> > It is not explicitly mentioned in the spec that one can setup the queue=
 using
> queue reset instead of queue enable.
> > As Jason mentioned it is implementation specific, one device supports i=
t and
> one doesn't.
> > Hence, it will break on those devices which doesnt support it.
> >
>=20
> Setup? No, and spec explicitly says to setup one has to use queue_enable.=
 But
> this is not what we discussed with Stefano here.
>=20
The above sequence you described is not well documented.

> > Therefore, I would like to add it to the spec.
> > "queue_reset register MUST be accessed by the driver only after device =
has
> reached the DRIVER_OK stage."
>=20
> I don't think we can add MUST requirements after the proposal is in the
> released spec. If device has stricter requirements than the spec then it'=
s not
> compliant.
>
Lets resolve above question first about how many times one can use queue_en=
able before DRIVER_OK for a specific VQ.
Without this either way driver and device combination is broken when queue_=
reset is used before DRIVER_OK.

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

