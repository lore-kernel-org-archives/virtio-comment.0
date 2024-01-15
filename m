Return-Path: <virtio-comment-return-8914-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2CFC3DA79
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 05:59:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id ABA222AF78
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 05:59:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 95878986468
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 05:59:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7710F98403A; Mon, 15 Jan 2024 05:59:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62215986367
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 Jan 2024 05:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8koHhxGyF6+vmTlzo9jA9esrqsrolVf2s53W+6w9nD7dlsj3qJZv71rfo2cAFrcfUvGu475ousp02wOQSi0fnDZZOmxHcPi1YGmGU7wTgRS8zdQ8/VNtoHZMvwSF6+J27NcHv5gsnucjlJd3lNBi1QQa3haOhlbD6XC8/WssIVME2KoL7I6JAQWvPnczM01UnfYWwilZfWGH4ufWC63Tu3mEJYW/HFkYV0xHYs22dpY/wtCnVj94l3ltEM3CNPvM+dL/kTox09nZlovJe0zXuFVxwDRNgRhoNQNhoyJpOPmm56dKAdaCkWL4jeXvTZeZ63gAVZiBS3cDpE2ypsTZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ADr+v6K/evIcfNm8b8Rl50Z6Vyvi8aTanJvgSSUO98=;
 b=hxaetxhv1yWG/hjTukWUgOqRn71DjRYd5X2S5Hz2bTQrk6I5NoZfOGz72yEEW8cmnes+MUYybWtsmDOzSS64Jl3gZKZItCnRU1R5EHdKXs7LOch2f2B5kBlm2+9R/7KLFfKYRTU1JogUBLdW5hgUX+ECPUuXkYsqkkdgbqoqroD4QYH/CcFe/HXvAmuZOtE5ln3AQ2MiNIbwtRYS1J8xDjprHcrSanNgAJGPO0UzsrnAiCpEOdoWwc/3ro7I3x/3o/QKD3Ox0LUp5iUaJAKiOZx2eAczKE7jUNTuOkNKF9qGrFFoM6Lo5iJoKtydptnlmO/sal9iksDb61JqG+b8Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "yuri.benditovich@daynix.com"
	<yuri.benditovich@daynix.com>
Thread-Topic: [PATCH v1 0/2] virtio-net: Clarify virtio_net_hdr size and rx
 buffer size
Thread-Index: AQHaP61lKhstNZGX7U+bz+HUOkdEsLDacIBQ
Date: Mon, 15 Jan 2024 05:59:46 +0000
Message-ID:
 <PH0PR12MB54811CB1F5B077F18B5E7225DC6C2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240105080055.3459531-1-parav@nvidia.com>
In-Reply-To: <20240105080055.3459531-1-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS7PR12MB5864:EE_
x-ms-office365-filtering-correlation-id: 58d14fbf-ec35-4f70-5eff-08dc158f2d40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KYzxeuHGM82O9AfRmXnnbpRgOt8DhhN2VmVOyZYB02BkDTcfAXAYAXFThS+iQFozqy3li/8kIYtahZEOu3K8Gz9sCmfNt0SLD3PxVkmgSI1fW++GjAbBO3NAtfwL/U0HBdDgDLxYZXVs184L9XnJf9cyVuPA2HU1YQvtOhzae6tAtz8HjRcPRBb9BBXkZMx6YFmUQImiUOi0PeT1UCONf6R93tjMcnnh5qpFoWOU6tAqtb4E/LL40LAsDUgcdFDwnpTTkikGpKw0/3yxDByf0dDWNZvnULrsqxxGde5Czr9uY9MvlP3qpGZNCEq6E5enH1Y1KNxhZ8DqjbuDzYhAx+fL7koiYJeePd6mdDv/DAf/Pju0UgmqvhiLTVdYfSs1OhgWoCZc2Tsb1cCW1lgYFbZT1Czr2Xw9VRG8qIZyRa4ubMaBS6D4XJne03OiiEXc8ZkSRayG4rL/srbKw0IoTQ2dFEGbkPeUZqxwodPPr+nbDXg6t78fUyuKPl4rT/AoFDP5A5FDW8QRvAy8bax1v/4AV2yKdzTIchvaSjwPnoUDHFPBk9gudELjOjlgrhTmc5RodJpCDqhgFW8o5HQG65+fdmPnsj4VMvLqoOZLVhDiLrsKD/lRmNn1WQrdsTh4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(346002)(366004)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(71200400001)(26005)(41300700001)(38100700002)(122000001)(52536014)(66446008)(66476007)(66556008)(66946007)(76116006)(64756008)(54906003)(316002)(5660300002)(2906002)(4326008)(8676002)(8936002)(110136005)(6506007)(7696005)(9686003)(53546011)(55236004)(478600001)(38070700009)(33656002)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OCFzbMB3EK/0yFpztURx4hgVCnh6a2EpCzWzW3GuH2d/L0H1tS78YCGo8/h6?=
 =?us-ascii?Q?mWFUcPLBBnyCxqyluE0lssZBJyNsHxsyuZgcju8L0QaiddZJd0JC5R8Ly/ob?=
 =?us-ascii?Q?zBiy0pIBc6Fb4Aw3/y0rVyu7mQhujH0ZKzz6TGgWWsy3VzXQvyhmtf9wUeP/?=
 =?us-ascii?Q?/RaREOgwR2+3FlvpD2vmtyEsNV54B/izRir2tSNs1YM3kOodyV7ZbFdGIQIH?=
 =?us-ascii?Q?TvhVRZe0et4Sw5s02Dv48AIJ1s0tcYioXL2zmNTHgPnaebW/ZbjfzzPhmzfb?=
 =?us-ascii?Q?FHEFxfVl7XSsHyquOMLR34KOaIcxehZ+LBfrfZ8/Vzs3yd+rIjdCw8QiYBdO?=
 =?us-ascii?Q?SZI14YkC3JeliP2vohv4M7fAudgtL/caJEGcNtggTaqy4OKnjMjM15PfAl7A?=
 =?us-ascii?Q?Nb4vW9jIKdyvXyJDsN4QHkckRz1eGKIbc5wn5a8U6OFIuEtdyHk5Z8jLTIua?=
 =?us-ascii?Q?OTZVPNC1t9tnVkwM0pTjYf43ESaK71BjLue8ioCbkX0m9lhtOS5v73oy8Xp/?=
 =?us-ascii?Q?IgSxrRp+xpLcnrYNj4jDFAfQnVioGRf7PibGSme4S8sbMqgvi24NMlMmsfor?=
 =?us-ascii?Q?UxYH3Tg22tEDqON/Fks0GGVvou4qIh/NxwtXT4Z+tRd4mRJhfPrtP3WE+GXH?=
 =?us-ascii?Q?P+3IuAYoApmjtu0k23VWoI0LpsVcBgFN043BTjd3rhlwKq72ifrCMDI1tPk2?=
 =?us-ascii?Q?JdWgxRIiNM4oOBdxczFZnNTuffrwuZRObJ7qij/AF5S4T2KOH3KM4LhFh3L9?=
 =?us-ascii?Q?D1r9jnsYhqLoZCTQNjjgZoukG59LcygmTcIwIHvGytwjU27gvFAcCQF7Vq8r?=
 =?us-ascii?Q?vdLUbhcOGbs1aBH7YZ+n/LskgwVruVLxnGNczIC47bQqC+1sz1NmiPsX1vmE?=
 =?us-ascii?Q?PsNsMTqe5JRUI0X2sXUeQZ1cQdL7T9HiMXJt7wc75JfOCVTzoOhZBJ79SBm6?=
 =?us-ascii?Q?GNKx2R3n3VkJv2QcbfvFxjGT/6+yWRegbVJ1/GFXSpCBWzl9M1wjo+Sonb9a?=
 =?us-ascii?Q?+JpyUuQGj1CUlu5O3dI9HpUbAmzYhUTlbXpbKCa80I3UMcLBrRxtNcACyeib?=
 =?us-ascii?Q?W6aVhDI7bjm6/YKMYOuQb18X8CxIyhXfnd365E7kSq/xN+HaIRndLbt5cRa6?=
 =?us-ascii?Q?7cKPWab0ANlWdxia0MQ5x39R8YQRMRIF0R3kuoVTkhXN4uYM8pvfcUUSPE3a?=
 =?us-ascii?Q?dpsl79LcEW9UY6zZe+xY751IcWB5YM6g1YgsRZgW8z+RmgZzeYo8ZIfyOtt5?=
 =?us-ascii?Q?qP1M4ntVJyu4qKzbAgsl0uO0b8U9Hgi3wLMgzuMEeEw7IndvDKFDMAbjPNAd?=
 =?us-ascii?Q?3wSS/70TYYZMBCD5ZJlPpjtyDg79CjRGFQDDWq8JenBTQUTkcTddO7kU7Wtn?=
 =?us-ascii?Q?rbtonHnqCvC5lZXoj94vZz9K9pcKm5ZkvklN4D+QjdW78zf2PFTcrMSBc7a2?=
 =?us-ascii?Q?S60HWkZ0D824hTf21TJDXeyZzt41GzdF/VonT2yVYjEhHJLHtBv+9Y0oVfM+?=
 =?us-ascii?Q?XwK7KGxkkkgoiepmiXPrQBVjujkCCQYnzAmx+tPM9yGbbUarcWH3l8UpZlWC?=
 =?us-ascii?Q?VOHFAiV87UUYCJ6SfQI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d14fbf-ec35-4f70-5eff-08dc158f2d40
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2024 05:59:46.2832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QlwxNWFR5BsYTl3q6EwmrOU9Jfin7owvSRdcLL617ARBt7gEwyhg+UygCfOZSQYMrZ6DigxlVEGQXHgU9C/Y0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5864
Subject: [virtio-comment] RE: [PATCH v1 0/2] virtio-net: Clarify virtio_net_hdr size and rx
 buffer size

Hi Cornelia,

> From: Parav Pandit <parav@nvidia.com>
> Sent: Friday, January 5, 2024 1:31 PM
> To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> cohuck@redhat.com
> Cc: Shahaf Shuler <shahafs@nvidia.com>; xuanzhuo@linux.alibaba.com;
> yuri.benditovich@daynix.com; Parav Pandit <parav@nvidia.com>
> Subject: [PATCH v1 0/2] virtio-net: Clarify virtio_net_hdr size and rx bu=
ffer size
>=20
> There are few small issues around size of receive buffer and size of the =
struct
> virtio_net_hdr as following.
>=20
> 1. VIRTIO_NET_F_HASH_REPORT is only applicable on the rx side processing.
>    However it changes the size of the struct virtio_net_hdr for the tx si=
de
>    as well. This was not clarified when VIRTIO_NET_F_HASH_REPORT feature
> was
>    introduced.
>=20
> 2. Receive buffer size calculation description and requirements did not
>    reflect negotiation of VIRTIO_NET_F_HASH_REPORT.
>=20
> 3. Receive buffer size calculation was incorrect for ipv6 guest gso featu=
re.
>=20
> Above issue 2 was reported in [1].
> Since issue 2 and 3 both touches the same set of requirements and
> description, they are updated under a new issue along with tx side fix as=
 well
> touching the clarification needed for VIRTIO_NET_F_HASH_REPORT.
>=20
> Hence above three issues are fixed under issue of [2].
>=20
> Patch summary:
> patch-1 fixes receive side description and requirement
> patch-2 adds transmit side clarification for VIRTIO_NET_F_HASH_REPORT
>=20
> changelog:
> v0->v1:
> - addressed comments from Xuan to rewrite tx normative
>=20

Can you please raise the voting request for these two small description cha=
nges?

> Parav Pandit (2):
>   virtio-net: Fix receive buffer size calculation text
>   virtio-net: Clarify the size of the struct virtio_net_hdr for tx
>=20
>  device-types/net/description.tex | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
>=20
> --
> 2.34.1


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

