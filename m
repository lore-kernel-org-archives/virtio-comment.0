Return-Path: <virtio-comment-return-7739-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712F3CDB465
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 16:55:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C591F7C928
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 16:55:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BE3D79865F1
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 16:55:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B599498642F; Mon, 16 Oct 2023 16:55:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A83B59865D4
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 Oct 2023 16:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9SPlVwae/vXVkRFdwdnyz3sBXXfxTtax+Bp5BdIvk7CzJ8DHTTLYci1qlStLM8eL+rqzsHjyWzvMK+3gLNm68R1ZP/7fR13XqA24cvo790wpeKMVIjSTDc0YsPUvcT2WwOtHATb0T8PrBpU3gWJ4icqeisXgkxE/SQrTZexblRjTcthAEHJ1GDu2+JZYbujt1H4DAI1eaQn3sDLHkc15wPTUjlxNjBAAz0V3CtTHoOSHUVxlb5FE4PZlJCIl5YSV7FYXLzLlrpe8tCxsi82SHV8gTNHx2ggn8B9y9cQdcbScGAd23ikANRKVs1SPm5NSM8ujQFAGYqpuo8FnQap7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzpsY6NHbiRusi7nieG+Okp0EyjhYYuCuVRQcZVL5HQ=;
 b=gF2mt0op1Gog5OB75O2FP8gUHQp1tY0rbTkSRzw+zgSy1p06JEmCfkYluQAi73uqSgvgmwfnTTbg2pFNEdGNYsECMB6znCkqKr3r9t29NIIgsHFySJuIseQGt1mY/vadSMPLv/AJkFpKMio8+9e+MIrpzd8QSGAnHFs5F5bmq+mfzQtsanIbj70Tu+H4gSzCMwnTYih3jCqgrei8hez0fJ8SSpudWYPF4WznoDm6qvm2D04ztLV7bxcuaAar5IejjVaZ9YYN4L58rCFhI6JoBt8qFNFQBCbW7pWJP2Z4/2dEKZ8qOLmzPzjeSyoyZlZU5MuBxQL5mtn34kIbBAs/NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Heng Qi <hengqi@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH v1 6/7] virtio-net: Add flow filter requests
Thread-Index: AQHZ+N1MZ+YnnYPgx0+DSL5JpcNf4rBLkDGAgAEg7IA=
Date: Mon, 16 Oct 2023 16:55:37 +0000
Message-ID:
 <PH0PR12MB5481331C295E30399C7F995DDCD7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-7-parav@nvidia.com>
 <SJ0PR18MB447766D1AD4EB868AFAB4F60C3D0A@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB447766D1AD4EB868AFAB4F60C3D0A@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA0PR12MB4544:EE_
x-ms-office365-filtering-correlation-id: a1d4661b-da24-40ef-f685-08dbce68b8d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sbVhZ0jHtPmH2IfXbACIML+oZK3kWrdOLNenvK5BhyjNVV6mbHteLpgy88eZJ4k4+HTtNKt5uCRQ8RWFUwPFyW3H3yW/b+wISJHdZNjHj9LIutAQ1v2u5AIpf+LBEZx2g2YQNseFM0Fdi3NR01ohRWGOSL38an7LWmgPCcDFRymm4SxqklzzEV/0NRzlhPdoCrY4a6/lFhpcKpuRd6j9Nu6E+PdHxDUsYZUyk+NNys/fq+gTI/oUhufnSpJMhkcH7ln565TVYMAEJn75pKgiGPZKptiu1APWWyeXR2sgFo9+ZgpnqGZ7gCtvTmf9CbwDmmx5VJMElV0E4ciJT/+/SOnWv6vxfbMN2gcTpK4fbmMaBZK7STfHuzHz8Le6ZYMxk7EujFgRLppp/pz5rd9g6Sscl8S/ZL9ZVbSyaHijrzuPDFKyreYBPTlJ27zG6w7+2RW9n9Jq1HJ8a+0add59TUIoM9ARIIPdWUz8rxi+WRBRuRxRr52cHX94KZmkpXgWeRMKWSlqStKso3CQ/vRt4HvksNcgDQrFAk4MIYJptskUN5+hho/jC1orxCn9OXjaGCnY87346cZQHzUdIIBYea3pXViaMtH+1tNNwubJqRbOkYtTpT2iPNL7h9ywFFwFwAHQx12mGtN+qxlR/R8LDw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(396003)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55016003)(966005)(122000001)(38070700005)(38100700002)(71200400001)(9686003)(6506007)(26005)(7696005)(76116006)(66946007)(66556008)(66476007)(54906003)(316002)(110136005)(66446008)(478600001)(64756008)(33656002)(86362001)(2906002)(41300700001)(4326008)(5660300002)(8936002)(8676002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?tDHK0teL/K2PyxplGZUur5iu9EV/X9WmOmIB6WNiun6vuR4XWX9H6dACG+tT?=
 =?us-ascii?Q?45+lroMphuJ7NV4Cn7FzKb9tRDf4KJL0Tt4ODPRX0DPFc1BlGBSx+VdxbYsH?=
 =?us-ascii?Q?fsQFRLajybUgfuwcaAg0Jv0fFNYjKxGaV/f+Rtz8C8uFHa9vh70wAJLBWfWf?=
 =?us-ascii?Q?t+3RUDUNntNU4t6dASKbvM34/H+CZpwaFRpRVb6KzQAALPOscPYkdBtCzdeT?=
 =?us-ascii?Q?1S/mkExekitoHv6B9bBqYr869wcnxlHnQ8obqeBntX6SNx/xrGsMtUse1R/E?=
 =?us-ascii?Q?q9t/lewFyk0XxKS7aUxYkNEKuPZiF7kD+L+WLUM3Kjzy4d3x4MJprdUrdJNZ?=
 =?us-ascii?Q?ofYtOaKVuYMBeYd2DlB8d7nDgPffqCVlBjIXqo4k/ZTSKUWjgVaO64Ipyc2M?=
 =?us-ascii?Q?5f4T77hj4lsKOZhEyey+EdY5zSHOHkA10jpeh1JE6tCLAjhSUVDambIF8+xZ?=
 =?us-ascii?Q?TAarOzEipPWT/bg29bS3Qi37bsJymLzxMoGI3ma0LBM2UVTPmg3uh+MIHqwc?=
 =?us-ascii?Q?I3WuM2I47Pq3kOKfaisUkGBPtsIJSrFPHJeJU+0ZB0RNoBo3uFaq/QgUCHXy?=
 =?us-ascii?Q?2aDXOCbw+7dI5GpAhBaJdkYB/cBLD1rgM8o+Cics7QE598Oo/KA3p+/3TcYJ?=
 =?us-ascii?Q?hU1YL4EkfbbPUUAyyCQlUm9+EmvVNW3rRtRNKZRpMoClJJ7VmNd5w24xrOR3?=
 =?us-ascii?Q?smuxNGITnnjr0tr7WEla9up7m6PhoN/WvKrDWEnZx8XEuxp5v9xWcYPLd6wF?=
 =?us-ascii?Q?t+XObGwQbZkew0IX/KU3JWyf7iwbN9+HIGAyAnWvvZvBYz+YG669du1Yjr1b?=
 =?us-ascii?Q?4hLtAltpzQqu5IJz6b8TldfMmyi1V0uS67tOUvO3hmb7/gzmSa/aZR3t2/OW?=
 =?us-ascii?Q?cx2h84dMOGci0rH7aNAnIJxe1fiaeoUPWQ7fwiSKvGMcxPRzIVUp64p9A6yV?=
 =?us-ascii?Q?ZaPOG9ovvYrZa9uLa3Gp7diiO5PYtUqYM4Oa3OKdXfCwXMr/cTDb1lz8LXlk?=
 =?us-ascii?Q?KZWx8zHdR/rDBJqGl8GF7O/cedt0ljzygVBwno3qDCfoPwv1bO2yT7YjJgce?=
 =?us-ascii?Q?Thik8hMzlva7qfVMsPoK/586HvtZIaDY0jWH7O+kp4Ed9m0z8woi74hm3fBy?=
 =?us-ascii?Q?zHF2NbfdIabr3XbfjyL0vCXmXgPumFTPEBpiRaaHFCtIuSqrXft064Z+vUOw?=
 =?us-ascii?Q?mkQ4JICX7Y0kYGl+JW1khMP+LGrqDDGKR5ep7Gs56c3R07PHWKqdA/ft+H1Y?=
 =?us-ascii?Q?G3rBZmsxgXYsqOxvUS9fVS7WhlzXRFOm1kSY/m0jlrY7LdGQ7H1NjT5sKqd0?=
 =?us-ascii?Q?cQMEBPPGpHLDrWkTScXkRYrfLKZCrfdQ7KHCJ+vSDAAFY7rZdoRcUUkh++zN?=
 =?us-ascii?Q?R/12x+UFl4XK33Cws3OSjSPOdRV1PY46BNdJmG1BACH/QkJYDMaGqtaGOrSh?=
 =?us-ascii?Q?LyR2cWLLH4Sn9lD//U05hbNX7ESpQbWBEsWOHWu2BY+UX14VAZhyPgbR/1Sm?=
 =?us-ascii?Q?6rnjSQR66MJ4Vj/k0EMAzwkF77kaOPsv2b4DneuzVc0Bq48snOE43zqP9lrD?=
 =?us-ascii?Q?KrD3zyzvMLWvuk0V/hg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d4661b-da24-40ef-f685-08dbce68b8d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 16:55:37.5896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eK8BsU8qn1eRk7ylDgNkV7+IesiEsMK6fBRhrwa9PFcOGAoFzWOSEl49k/myVnD/BJh6sj48ogT3Ijhv/uMDIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4544
Subject: [virtio-comment] RE: [EXT] [PATCH v1 6/7] virtio-net: Add flow filter requests



> From: Satananda Burla <sburla@marvell.com>
> Sent: Monday, October 16, 2023 5:10 AM
>=20
> Hi Parav
>=20
> > +#define VIRTIO_NET_FF_DEST_RQ 0
> > +
> > +struct virtio_net_ff_dest {
> > +        u8 dest_type;
> > +        u8 reserved[3];
> > +        union {
> > +                le16 vq_index;
> > +                le32 reserved1;
> > +        };
> > +};
> > +
> > +struct virtio_net_ff_action {
> > +        u8 action;
> > +        u8 reserved[7];
> > +};
> > +
> > +#define VIRTIO_NET_FF_ACTION_DROP 0
> > +#define VIRTIO_NET_FF_ACTION_FORWARD 1
> > +
> > +struct virtio_net_ff_add {
> > +        u8 op;
> > +        u8 priority;	/* higher the value, higher priority */
> > +        u16 group_id;
> > +        le32 id;
> > +        struct virtio_net_ff_match_fields match;
> > +        struct virtio_net_ff_dest dest;
> > +        struct virtio_net_ff_action action; };
> I think virtio_net_ff_dest and virtio_net_ff_action can be combined.
> In fact, dest is only valid if action is forward. So, the additional fiel=
ds in
> virtio_net_ff_dest can be added to virtio_net_ff_action in a union and on=
ly
> interpreted if action type is forward.
> Also we would need support for multiple actions in future(tc flower) so w=
e may
> need to have an array of actions. Similar to
> https://elixir.bootlin.com/linux/latest/source/include/net/flow_offload.h=
#L328
Let me look again. I will get back on this.
May be worth to add multiple actions now where device reports the capabilit=
y of supporting single action for now.

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

