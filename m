Return-Path: <virtio-comment-return-7983-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0423C25B48
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:24:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0A8E22AD5E
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:24:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE475986A5B
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:24:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E36A0986A4F; Thu, 26 Oct 2023 09:24:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D5C3D986A50
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 09:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnIt9f01rHXFS8YQV59Nj3hJVr5rJ8It73okLeGqHPCYzD8q/zbKN2BkLHMgt7aRzpKNbjP0FLeBazYOEDVAguFDz1ERcdDb4V0lkd2/snUPgK6ioknDXVpGQlWpr0xUbovw/PjcFwwnnvWdK531HNd6hC6ufCY3PLF7oAeb/LYFMUeKggXOFdzzFFK6hUC2975SzwY1D6x3Gl7giBYkDQK1yQ6EXwJr+wYOZxs8dmf2HmbIoTmtMCya3zBilVsoZjde8QJD/uiDr/XSkP3Q7/Hgty2ynsZbpktm5nCXJvX3e+ovsQnpQ8JHixTdV4Y7N66N5Enu/mWxMdNHb1rNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pu2sBiu4W8iukhSNnexn2G7a0NQCFLlp+y2mtgNkHoo=;
 b=FxsR+yEkBW2RUsQO5Fx+u9uEBfpzLOh4bm26SsnzHdUKRf7dsgo8xXYkPfxF9KF14jQr8prrOJv1amdqOhjEpYcudk5lSlfHY48FhbAU056O5f7iukxnxAbpw1CmIe+Ufqseb/WkwQFuXSlfDBkt6Wj+A4tsKNR5H637+6j36BZocjlLpKyQ/u6hNmdGnwjWddsa1hNFT7s3qf6J6USyC83aNhT/PO7a1UTkmmRT6bEUp3rhuKxhlLY0AT5mNisdef3GwsbcogrWuUETkLij1RW3cM8IVbZaM/+YGFCGKWmqwypPx0/x7QsAwH1roRsKGykEN1GCYRk7IEH9nmRN/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Eugenio Perez Martin <eperezma@redhat.com>, Cornelia Huck
	<cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0IABwd9wgAZBiUCAAAgxgIAAAJFwgAAH/ICAAAX5IIAAA0oAgAADzbCAAss+gIAACFOAgAEc2TCAACXpgIAAAYlggAAtfgCAAACsgIAADLCAgAAB9BA=
Date: Thu, 26 Oct 2023 09:24:06 +0000
Message-ID:
 <PH0PR12MB548176388094EBC243F879DBDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <PH0PR12MB548172C89C0213867F765012DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87ttqhbcy7.fsf@redhat.com>
 <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWcFKGTpHSUsHePUA4sTp_NthrTs9dzdVKoRcuM6e0G-kA@mail.gmail.com>
 <PH0PR12MB5481402BCC52DCEBF6A90A7FDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026051240-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231026051240-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM6PR12MB4252:EE_
x-ms-office365-filtering-correlation-id: b2cbecf6-2c30-426b-2013-08dbd6054d99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Wk+6msYU0JHfKMIpzsmRFNv80hnmewPlbo1JkEdIJ9WyZatVLmcf2TGrS2cf7oL2goETR1IR89IZvsaZUwl+JbTy6o7QF93uvuY2U8YwDwLZkceMILlDCFr44HZmlqe6q/Oo4csf9JpZ3WdrJg7faHfx8lSEWfvhXgbOJOHH/E1ZGRG+rng5tcLhpzr4/efhpQ9SUb01RQwB3s+1smrmZNJ12WbYV/gHrbnGVQTrgBb3E6X39SzzjhMEbzaKyy4eWM80B/I8V0uE9lU07dGAprFICHXBqmdtmvi4qmFdCDtA655VgNMtuevfsm++zLjv8WV9dbnlmQ4FOXHVeJQS0CeujY53aq+phgPkjnz+aJ7DCRE1gTu9inBCTJT+QWv87YaZvcUtrEeGJqLXrzc6sbnCF7U8rTDr/jwQiqlwTcZgwn+wKag0SkGWFjGA4r30gp9rmzDQHn5w+VZkCrHjxzyn0Wkq3+RLEc1TM5QjvOL7KtShZxolJP9o1d6o5KnsP7vgUPNpBpX61+GzbJTgsxlCU33NPysgZZm2Pd42npAfEwOq7S/ymCglIMK9wZT+WTmqsR9Z/12jZcNzNFVqi2r5DRrR38Im0cbfTafnS8jS3AarEe1M6gSernWRUy0V
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38070700009)(26005)(38100700002)(55016003)(2906002)(4744005)(41300700001)(5660300002)(86362001)(52536014)(33656002)(8936002)(4326008)(8676002)(6916009)(54906003)(71200400001)(66446008)(7696005)(478600001)(9686003)(64756008)(6506007)(107886003)(66946007)(316002)(76116006)(66556008)(66476007)(83380400001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fHHGWarW9edd0XZOyfmEKky5TGjKIKBDF0mvt/f44NUJsTFMKgqFmfjsLXle?=
 =?us-ascii?Q?t5w4nymKcr6A8l2E+SN9MPCglGQsYuJkuirZGQu93qNVCZ5Gcu6CzNXnEt2c?=
 =?us-ascii?Q?/unNELQheEre3KnJzME7xM1g3hCjch9lcZNFzv6zR3wdcCBulXpY3ovmYBvZ?=
 =?us-ascii?Q?MnXEp9PQaurvoNK0ucoPCtLvdwSj6AD2HK9/sjBobgb1smuHgE48zc0isfSV?=
 =?us-ascii?Q?XlzX76LWJsMSoNwdXP+ZT8yuCuzSo0nlbU18LGTtlGxVRdm9NpwK5rnHeKQY?=
 =?us-ascii?Q?fiIJsLDES9sE4SUlXo1uMkfuN0t8nObhkZ+tCMWNmeOEx7qzlQicKaT12EDR?=
 =?us-ascii?Q?7npDlrHp0iT3SYqqbB+01DRbjGPGlfx14TPMsc0ZyCUgAdzmyijcYTGmi20A?=
 =?us-ascii?Q?QSr/gdn8Dlmgate5mILfOM6UshD4r4x+YvjcoIrRaU5CToohbdyrszP7bg+E?=
 =?us-ascii?Q?HCXkscQ59GWbblr4YnQEv6EtJqa2+LhsCXfVQMkax6VtcEcsiqesX+A9NQ3V?=
 =?us-ascii?Q?5sjyfdTmAZL+UOxhfVq7AyKO07j7HSDCeeYjPJatsp8YtST2JA6kAlMUVf6+?=
 =?us-ascii?Q?FCcVYFTXQhFJdS2CdR4q/jpiDA1yEP1rI7IvQ0nOdV2VXLEa+35jYqVjTCvR?=
 =?us-ascii?Q?yEuL4MpPHKZiIOv7gvDtHrTkyjG4tblhyifCgUBDnQ+g7U/OYxU/Ce5fn/Im?=
 =?us-ascii?Q?cN/MHQpY4/APtbB0qPssRFtpVAhfLULQgUd0zwte3rhJElLK6+TIW4Ir7rDX?=
 =?us-ascii?Q?zJ84XTprcnuBWfjDTVTRBVF37bpvfBzxXdIGz1ZWcmniMDJR6XSBqCPF6g4E?=
 =?us-ascii?Q?dwtRco6oyIvgnlwj8jvmd14QciV0ePdy5KXPtS2CgjsLYQJj6Q/aDKNuBtdk?=
 =?us-ascii?Q?GZHrhUUIpzI5TMKFYKBdnx5o5LGE/x8FZUjIGwljFeYK7nNQDTd13akA7HIg?=
 =?us-ascii?Q?bfGcOFtSZxAVf+BFLLULqeQF+tC32EhvmRU2YysElv1UaIoo4XWH8IHarTFt?=
 =?us-ascii?Q?/MHq6YIy6n+v8W2VHr2N1m/ffTKDAIemTkyZYTfax3hjN6kWKjsP/Ri/TaDy?=
 =?us-ascii?Q?y12DBZig0+GXmyrbBxYdJyYP5/Dnmv2nLBoP7IoI2uZezd7IVQw+mtnQ32pQ?=
 =?us-ascii?Q?PP9KpDY3yid5NDjk9GfW1cB+trm1Fi5eKz9TXi4DcaIqZ+SuNYuaEw8ZYCw5?=
 =?us-ascii?Q?JeedsUOCN3xflbKRvNljvW/vGyA5r8+BM/xwCdConf0Jruqssug8vAZmqpKM?=
 =?us-ascii?Q?6AEhtuELbMrPr/p8p3CCL2kS0+KztNikS9WH2Ho9HjSc+nCJUmceIPykLxV0?=
 =?us-ascii?Q?/Cd1s6Jxkn8nFbJQgIhLzIZ8AIuM44ibNxsgGF0jCbImg8JRLWRLOEggx5gD?=
 =?us-ascii?Q?rgwCh+ic3aQd/A1fhHQwGG79GGkA7Ls3kcQOeZH1mQhtRtJgqR3kmbC5zSwn?=
 =?us-ascii?Q?72p1JN8mDi37FQ3U+OJVRly/SY9ZhXJ2nKM60UX+4BlbW4Ez+GSKeO7ogmBw?=
 =?us-ascii?Q?ho55dRmZpqo9Hs+PYWJgF241VWHgpB6YXBzn2VfCSwRSCnVgYzIJ27gwU5r6?=
 =?us-ascii?Q?jeSAVXma0swAaL4Bpe8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2cbecf6-2c30-426b-2013-08dbd6054d99
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 09:24:06.7929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QemKQwQazuYXtrkpm14NEGxEnOpAVga2iuhvTT4Z26MGK6I2nsgRqSQ8ewIZ+oE22INvLYpVlUULoKciFlIPog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4252
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, October 26, 2023 2:46 PM

> > So, this will still provide the unified approach when/if needed on othe=
r
> devices.
>=20
> What do you want to know? Whether dynamically adding/deleting queues is
> useful generally? For example, queue per CPU is not uncommon to avoid nee=
d
> for locks. In the presence of CPU hotplug, the natural thing to do is to
> add/delete them.
So for those devices who care for such performance, it is reasonable for th=
em to have the cvq providing channel for complex and dynamic commands.

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

