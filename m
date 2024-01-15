Return-Path: <virtio-comment-return-8915-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADC4C47258
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 06:47:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CDB442AF81
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 06:47:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ACD19986396
	for <virtio-comment@archiver.kernel.org>; Mon, 15 Jan 2024 06:47:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9164698403A; Mon, 15 Jan 2024 06:47:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8143A986367
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 Jan 2024 06:47:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xx9IkPc50XX4y+nd27a99Qz4esQp3gArM4NpHQo8B+g97erIRbWl8mNa7+Sgyx1pDcFkIJJhgQVn7bUW6wcCLaEnpmz4azEs4yTAn828pjJzzYE4h0ZwiHc9nzOAspPbq90DAKzQhC7eF2UFsJEa56sG/mQG/yiVrZjUZzbp2sDKT7wwAfEbB6fg5ywzeoYWTjbyx7vN+6dhxG99k693xva2lwAoIQTPQgJA0Q9ssmG7NlImqLKtEuuOL/y4dqR0rNEGT4jyIH+c2Bcn4IVBCpYiGvNI7VLlap+9p8Nks1Vcdjjl01ZjRHzqiF6Gqs/AhxC3+45soV0kycCsIzfhjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjXMT8P70UyhYUTZP0VPeBXINY/VLP7VLTafwALu+DU=;
 b=iULoG3wXTr/NthtzTpG+aunsMTfC43NZOcbhzYA+oi1eVcamw11IROd2NhGYxz3D+QSicXjaPzE+g12THAFMr5kih4h7Frt8vAmKjsh2F7BWvQCSm55JJL2UeHWcmnTc3rgiWTmuEX3rxHWjUhlbWekzFAeJ97jBfzHeyaf2v8XzGpG4k68JXXlp5peKnH/+LPHQAKUcDALzXvUD/wxElosIj/7aMtAyWrDX4KHEyY/G1t+fZdp/tGTmq1I8LCTJn84fipkxnOQHTn58wJB5cA4wu3ryR5PsWYGapzcg4mwC0h8GbNiQSCyOjdN99iWxgur+OxkMOvVn+fwbh+s7rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "yuri.benditovich@daynix.com"
	<yuri.benditovich@daynix.com>
Thread-Topic: [PATCH v1 0/2] virtio-net: Clarify virtio_net_hdr size and rx
 buffer size
Thread-Index: AQHaP61lKhstNZGX7U+bz+HUOkdEsLDacIBQgAANXcA=
Date: Mon, 15 Jan 2024 06:47:44 +0000
Message-ID:
 <PH0PR12MB54814D477DC0FA6CF58205B0DC6C2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240105080055.3459531-1-parav@nvidia.com>
 <PH0PR12MB54811CB1F5B077F18B5E7225DC6C2@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB54811CB1F5B077F18B5E7225DC6C2@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB8800:EE_
x-ms-office365-filtering-correlation-id: 26bdca71-53b7-407a-3dfe-08dc1595e0ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uh76+HPUiwaV/fH3UZydM5Wm0hR9aVfRt02SP4VVt4lTVo70y8+JwwYVI8e4fEHleMPl03HUmFFwJDrXrwHhdunP0CHBsVCLaCWFfep9EWgQVVVskonS37KfHh1MPY5FZ6gWYFzC/z9nwCPnSAY10j0IvFX0fwAbgC6FbCt1xFYxc005pRNqnFfvwDDZG3HiDW2m66nd1DrnWn1yfwF55h0xqPZMO3Qsx8hDkMnvn3Bi9oBWL/9TG6lPA1UuYR1oAKEk2ZgEzzA6Y2Bew5HyQjVMsaBwIn7lTlcCf4iP/YSdnK7qiO/72fqcTua6ulyK4inT7ioJpmXFqISs/B42isLzvzxFCRU9RGkKmjnpAo4FSmFx++FfxSiYxOhQJ087utvZv+mt51JeVReK9FTKHDvPisT0uZkzEMxcsCWFevmNT+EyLKeZOWtRZ9d1f/EdbNDbrJJl3esHYSFuw/v4KlFED08NBh9oMdNCZSBFSoE+3qX6wRhW0Nf+u/9fnS59sb73Wzr/V0nouXEhnj80Qkl4MibQXalPXln3DolOyy4psjKnh4TWFBT3eaeIBEUOdn0ubvUBrhYapClwK9J40CynlO46FHqFsmCpoNmWJJc8tKtzHKzn12hvJX0hH2K+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(376002)(366004)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(2940100002)(66476007)(7696005)(55236004)(53546011)(9686003)(26005)(2906002)(6506007)(110136005)(41300700001)(4326008)(66946007)(38070700009)(71200400001)(83380400001)(66446008)(54906003)(33656002)(8936002)(5660300002)(8676002)(86362001)(52536014)(64756008)(66556008)(76116006)(316002)(122000001)(478600001)(38100700002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8ET7XQHPSv/vwEJdmnPHmH4LKkG93kZf6ZpCuN4CllRmTy7Y63Lv7qbnEj0p?=
 =?us-ascii?Q?FTQko5mgInirPBAD4tY1b5TgKZRNQEBqCToTbydK8WFnm3BNR3fumIKA/W/U?=
 =?us-ascii?Q?Tj6z4SRMf3tnq/6ad6fNfJSH02DNKbWY6LTkAViFkiS4WMs5oJe3dQMhNo5I?=
 =?us-ascii?Q?tsdvmCgFaIcEWFjhA21SnI5wxJFpcBYzU1hItyf7Ygcgdlz1hEr8AJMAgClc?=
 =?us-ascii?Q?835/8Vdf0YKoUgS5Ggf7054f1Gc93q5m+iN9sWb9nidm3wWbUGkgZMcIHzUG?=
 =?us-ascii?Q?pbNBWOGkxextojjl0XmOy2HqqQGjHACiohchFlzr8hCsoRbdYt3JySI3wQH8?=
 =?us-ascii?Q?Cgd3V6W7eXOT1HWK7FcMghnRlxb1FhLHVRkGGejgHC/TpctAouUBxdDrqaJF?=
 =?us-ascii?Q?q8fwfK/Tulw1nJ6qMQKh5yKBOGf0p9KZx6jNr4AR4qAbh/MEdsw4+kNSa4KZ?=
 =?us-ascii?Q?MMAYBQjQRZXeA4GKxnhEoBtpRX5Gti6ePv6BuvlRRuo0v8PdR4NRiopvlZgM?=
 =?us-ascii?Q?eZRi/HtFI84DSAHl4fv6LCVsnWZkizh5S6Hp4ThTV9aNWDSHQ92lCzulST5Z?=
 =?us-ascii?Q?7s+hKcuhTkFtbJ5yEPNG1LOkUBqlrheoDe6zg/aw9c5Ahi7ELZ847YtmfOu8?=
 =?us-ascii?Q?x1g8j8wqFQgTw5LK8/d9iHeyyd6yLE/ISEqABqIjOfaUzj7Ow9FJVjOEGZRi?=
 =?us-ascii?Q?uowFqXKTjATe9dr0Uxsf4ZrR60t5wQ26WplXotGA9TEyAGH76kk/3zhXfe6Y?=
 =?us-ascii?Q?GxKNzjVt21TFXLr9VRYNLYS01M9yubhjnc5UddvWyVdtTJVRMTsJDzjK5HtA?=
 =?us-ascii?Q?lnB60PCgHczbGXh0gW5shaXRJH+BSB6ZpcN4BpD/tD25DFJsAjkWsH2up0I7?=
 =?us-ascii?Q?9h0UanYxlRxO4CdxH7SPWPmclPLmqbfMZ2tVeZfYsCJf3aAFZ6BV25CWFXJG?=
 =?us-ascii?Q?8UvDsDbIPjfVkXVwn7OvPLqE9iMsgMO6q0+7DqhDVT1kwat8G46G08nsBjDt?=
 =?us-ascii?Q?NvQgA0SfVGt8xLHeti4Zf7LTI64T6ns75M2Wmj5/iGhWEHE0hz7NrQWmcQW0?=
 =?us-ascii?Q?672ijBbl40gnqGixLfBGUaWGG1aW/uDVwH86RrJHTEquff5PjstezFJDgeNy?=
 =?us-ascii?Q?y2rfbeYBXDJNIcu5hv315HGxoGm6Im7W0K/NqUhlfi8RqieZB4BK7MY3DTEL?=
 =?us-ascii?Q?+b2e3KWWICfB8vlKt3tVYb262dy2nqFuJ+noKUjyMm9tEjyb7Mb9hjawklCd?=
 =?us-ascii?Q?RVF+0yRjAj3qSDud3riGm/+/QQKqlpSUyuOX4lV5BYnzMEMjf7ZBLEpoWccH?=
 =?us-ascii?Q?pTflMqqmABNw9oxZXbnzxcmfqs3QpVp6an0l5ZFVUQpCeUSr/Jk397gldzo8?=
 =?us-ascii?Q?9k4EifM49QmG9sdMCiCthkfbyYvMVZfiJ2xnnq4f1XRFAHNzlgQZmvLD7NnB?=
 =?us-ascii?Q?4TaMA6glB6+sx7b3QfWTl9RK7l8y+RuuiODF0aQGPqO+gph7fhh0OpP+uONB?=
 =?us-ascii?Q?nnXfKPdowoyIUByiarxKuE/yoTOiomtgUYYjkJVV7h9a4A6hb+u6C/llM+tu?=
 =?us-ascii?Q?/645jXIx8Z2wdaQ1TwI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bdca71-53b7-407a-3dfe-08dc1595e0ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2024 06:47:44.7406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I+m6vZcEoUPsbnsOMUdDvSs4xjFqkJU7iNOpAE3W98LyVMK5nsLZFYL3OQcXYJEWY1zjb8bnYysu6Vx3oioatw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
Subject: [virtio-comment] RE: [PATCH v1 0/2] virtio-net: Clarify virtio_net_hdr size and rx
 buffer size

Hi Cornelia,

> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Parav Pandit
> Sent: Monday, January 15, 2024 11:30 AM
> To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> cohuck@redhat.com
> Cc: Shahaf Shuler <shahafs@nvidia.com>; xuanzhuo@linux.alibaba.com;
> yuri.benditovich@daynix.com
> Subject: [virtio-comment] RE: [PATCH v1 0/2] virtio-net: Clarify virtio_n=
et_hdr
> size and rx buffer size
>=20
> Hi Cornelia,
>=20
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Friday, January 5, 2024 1:31 PM
> > To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> > cohuck@redhat.com
> > Cc: Shahaf Shuler <shahafs@nvidia.com>; xuanzhuo@linux.alibaba.com;
> > yuri.benditovich@daynix.com; Parav Pandit <parav@nvidia.com>
> > Subject: [PATCH v1 0/2] virtio-net: Clarify virtio_net_hdr size and rx
> > buffer size
> >
> > There are few small issues around size of receive buffer and size of
> > the struct virtio_net_hdr as following.
> >
> > 1. VIRTIO_NET_F_HASH_REPORT is only applicable on the rx side processin=
g.
> >    However it changes the size of the struct virtio_net_hdr for the tx =
side
> >    as well. This was not clarified when VIRTIO_NET_F_HASH_REPORT
> > feature was
> >    introduced.
> >
> > 2. Receive buffer size calculation description and requirements did not
> >    reflect negotiation of VIRTIO_NET_F_HASH_REPORT.
> >
> > 3. Receive buffer size calculation was incorrect for ipv6 guest gso fea=
ture.
> >
> > Above issue 2 was reported in [1].
> > Since issue 2 and 3 both touches the same set of requirements and
> > description, they are updated under a new issue along with tx side fix
> > as well touching the clarification needed for VIRTIO_NET_F_HASH_REPORT.
> >
> > Hence above three issues are fixed under issue of [2].
> >
> > Patch summary:
> > patch-1 fixes receive side description and requirement
> > patch-2 adds transmit side clarification for VIRTIO_NET_F_HASH_REPORT
> >
> > changelog:
> > v0->v1:
> > - addressed comments from Xuan to rewrite tx normative
> >
>=20
> Can you please raise the voting request for these two small description
> changes?

I missed your response to patch_1. Fixing it in v2.
Please ignore my above request for vote.
Will ask after posting v2.

Thanks.

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

