Return-Path: <virtio-comment-return-7578-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFFDE748E9
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 10:58:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E76D56846D
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 10:58:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D045398669C
	for <virtio-comment@archiver.kernel.org>; Sun,  1 Oct 2023 10:58:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B8C31983D6F; Sun,  1 Oct 2023 10:58:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AA2BD98652B
	for <virtio-comment@lists.oasis-open.org>; Sun,  1 Oct 2023 10:58:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MN0URjo3aQ3wuKC15u+ufRoz+CcbnDo3I+ov4s3CWg07heYndQteQ7nnQHvcY4PCh7lpjp1KmF85+iBbvMmmjwfrXnToG04rAu0M5jo7mSX/edA2CamsGJ+4biHl/foGkyKCu2F6lSKR+Us7dTZeK0A5dPWiXBH24Dx6zxniRweNqiKEAsE6MyrjXN91JK1eM9grnI97qomoKmLdNMsfJQEQnRLoeKa3oL5tfILNCEI+fjo7KMC2AKrqis9p7fAV0UEfrYvlerE3QVSJ4KHuXCVxe/+1vpm/AxruDuR2F/4Aquib7j7BoVYjCE4giEb1pCHq6mJSdNRo/gvjWMmjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RZEvxl7feIeIpkICSoTIzcRGftkgx/Sy0bF1ybdIWk=;
 b=b+NnURRNbvIGLRqimoJgn4KXIxyeueEh4Yq9EHvMualxnfM4wtsFw8G35WSacyDRN1b4pRWiEGCRLFuDkLSYZGiNT9mWxi9HQvW2jbmmAlutcQmgoPbPemgSRBjDrOFxdzaznOpju6iG7NExR0X9ptebmQVmMAg5SMjrNjrq6x/YSa+CobEZ2Dn042r5aIKgbAj32MiycRBKrC/mpwXDn0GI47cflh1g09ISQ08kec2+FkY55PY8ktfR7rKBGONatqad7zHgaU5YV/Oy5U0ycvL3lNOO+IFg8oE/d8HNUIlwd300l8/g9yjYLF4Jhc2sh56ou0svkP8Mpx8Ud2TrVA==
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
Thread-Topic: [EXT] [PATCH 6/7] virtio-net: Add flow filter requests
Thread-Index: AQHZ7VuahXGvMTAT0EG3s+HMuBuyLLA0vIGAgAAQbTA=
Date: Sun, 1 Oct 2023 10:58:21 +0000
Message-ID:
 <PH0PR12MB548173860F1BFC2282056F12DCC6A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230922134838.3718-1-parav@nvidia.com>
 <20230922134838.3718-7-parav@nvidia.com>
 <SJ0PR18MB4477626C269A031890BB6782C3C6A@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB4477626C269A031890BB6782C3C6A@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB5632:EE_
x-ms-office365-filtering-correlation-id: bb308b14-1624-4563-45e9-08dbc26d538e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 8uYCS7b8ZKJGEMJpNqZvlvxAR39KCcBCwsvZcuhyM8nD7Bljp0Xp/Mv8cEe1Tt1VGjr8KMJJCnf2GjC5fs2DmIf1W87MXup547VfJJYJlJ8AHfSxydHt+vixI8rMh555wn4htU3scr/r0QUZ5NrzDLX+aZG0AUXj0b7i3T+NfsQZS+1tWGhgUUda36TBDU4HHXFn81macieC9wY2b+F/7C1M/JDwH/LfsavW43YeTIa/uQxKyvwwpZAj2lG3YNWyYkHp1xfkRbL1evgAZivtWA5IUEOlo/ezqTgZlpA7gy83M5T5IAbSyYmq4uc7GNijHTWWo7cQZJL92ug4iHnH+xTth52vQe2A0xiHteUQUJq7l9CMkl/3sgrKQSv5XcOd3hnHN2xl4iIoE4GNvi2qE97YvYOEXK72A3+P7YLsPrpfwGu1+KiYMmDy418vjUrX9z1qVGvlSogw10SLf5vPPMz2+Q+3UQcuyAfOdH7hHj1I2qsfK2tt4phm/tIHdGIknH/DlIsa8Mx+RzPqHrZdrgiE8XEQ8J2SglV+5bSCYRYo+2UgARqr+e9uvlrT68W4fpMiEL25Xtid6IJ2CqQOLAVh+bRD4q0gnp9Zj3d9LOgYIJmHkyc1G355tr9pYcv88wR8xjggjo4mog0mBkmRGA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(136003)(346002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(110136005)(478600001)(83380400001)(8676002)(55236004)(7696005)(71200400001)(6506007)(52536014)(66556008)(9686003)(55016003)(5660300002)(26005)(66946007)(66446008)(66476007)(4326008)(41300700001)(76116006)(64756008)(54906003)(122000001)(8936002)(38070700005)(86362001)(33656002)(38100700002)(316002)(2906002)(87944015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?B/PnUrF2f0LtmfsOI/2kdBTscAyAgSNcQRO4CigZJ7tMdtUJEZQk/pNoO3Db?=
 =?us-ascii?Q?qekg+YGh7HozV5uYu0mlDGk6JIXtO95myHPGQr55bSYqNXu5OhZqVj9RpBOF?=
 =?us-ascii?Q?HK3XYNIvea3jGuALQQp9fBzFFV4krZn/VnJuKjqkGz+F5f9G22hzTlPgRvk5?=
 =?us-ascii?Q?oTCE1N/wPm8IMMIPVA+U1TgL5q45nprTu+8BUz9SxDBhGwHULJa6khZTmgPz?=
 =?us-ascii?Q?FDSfbwIgdUahj1uHnf67VRHkWFXnvHZb09JLdUXdxY+mLgRPOeUbHv4o1x3F?=
 =?us-ascii?Q?R5rlq7Blb3Wrd5t9TB0DnEntauTFa2eRuA6SVs5FtmKmCUTfxCrrhRIvNwnX?=
 =?us-ascii?Q?XRjx4xmDd7PalQj1a/gUuW7Sy1ii5ppNGAJRt1WrZNVBuuSZtlg6KfZ0Ty63?=
 =?us-ascii?Q?dfao3U6ST5ktLOMwKRkiaU26T42CULn+0UpicEFUuQ/JqPGyDOFGnxP0NRQD?=
 =?us-ascii?Q?vuC79Tkhn04ZRz0qeM0psg7Myau8G3a7OWhDVaOyTcVn7lG4Mf+mBs5JGS3z?=
 =?us-ascii?Q?tRYpDbz9jcZb5sd+i7U8fZVC+gnbLUQ2zktuX1rs+kymXUqZfdcg6GUCYfxs?=
 =?us-ascii?Q?w0ukPv5bmjCFcZkFW5tr94z0Xt8OG1ASF3HIvCTtJCbhR1UI3HISD4O2F3we?=
 =?us-ascii?Q?tvLLt54/VQANIQiMZvR9QA0Q6UQ3tx7jbZscI8ocqhkqSjZK/sejZWyfCu+Z?=
 =?us-ascii?Q?z9CYo16GzKWcPfxW/+WnWvf3hr3OaicFj2u4vC5C/ASPssWEf1J/KQ/b2CoC?=
 =?us-ascii?Q?siStYq1gzBL4/y52M8zffMGmeqciJKn33I2BGyX3t1BfopZby7bOTNQL3tWP?=
 =?us-ascii?Q?Yw6DqpyGJCmgcPBKWpxuizfotULvmFhjklWfMix1l+xrd8zyLcFC41Iz5fTz?=
 =?us-ascii?Q?+nmq6N/mmpDqFU294sqzF2bv5QviMggZBl0JKMDJRCrocnwj9wbDE6TG/glD?=
 =?us-ascii?Q?ZMZ0hfXmBOKgXOSQSM2IS96iRcs3hb8IF2HK9HOPEX9x2nTDqHdjre84f95w?=
 =?us-ascii?Q?ApuE9xhdvfBBHX3xTCWnll2opi+KET+tMT0kT5Z2XdmxuDDA2I7PFnKTvEOd?=
 =?us-ascii?Q?7/qDFTt4tEBOm3xXp4ztwWq+wN6V7gW9+klHT5RGMf5cENfQrwRpAWFgXH79?=
 =?us-ascii?Q?emGK86EKqwI06tFRVVugWbkvdSvnm+3o6PsVuj1C54ZoCjzy/shxUhgDr8Vj?=
 =?us-ascii?Q?Gx8QwZ/gB4p0qLyNtP9jxTJ/rZkNOlqUxnuOHkBNmw/XJNcAjnDola+ryXW+?=
 =?us-ascii?Q?tcfgobTgDUBnmIpWxvVdz4Kp6EUD3NTd3ytEWS0VXpr4XlImaTyX7/y1ptSM?=
 =?us-ascii?Q?3Fe9nnbpZzjWamT5brmzX/QEiFVSdPVgOVimZarLm2aV1wdfz8DwEmlZ7Y9p?=
 =?us-ascii?Q?sXgE0vtdAgEQwAtCx3AnNEA0CH6ZkhNLk2r5yjoeUPx2fwE/s/QN8Rmk4tjk?=
 =?us-ascii?Q?t83Fq5w/OIiPO/lvL2VPKil5znfLEopxUWMuwXGpB3+0Jgd76oERRMPucLzz?=
 =?us-ascii?Q?pLfsOy1CyTQkGgokUJgmscv/flH/Vf6NKOaoCX1IjTMupBhxp5svY8HAv2ws?=
 =?us-ascii?Q?qAl7dVn8WmZJerTV6kE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb308b14-1624-4563-45e9-08dbc26d538e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2023 10:58:21.1852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VvvdqV9+2SwqGwyN02yOo9pODlIIxmjat3jc5xyGGUL1rh9fcg2kjjsEqk0Wp8JHgHeyDM3X0lsVytTRAXGxmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5632
Subject: [virtio-comment] RE: [EXT] [PATCH 6/7] virtio-net: Add flow filter requests



> From: Satananda Burla <sburla@marvell.com>
> Sent: Sunday, October 1, 2023 3:13 PM


> > +struct virtio_net_ff_match_fields {
> > +        le32 num_entries;
> > +        struct virtio_net_ff_match_field match_entries[]; };
> It is better to fix the network protocol order here.(l2,l3,l4).

It is recommended but I am not sure if we should enforce it.

How about writing it as order SHOULD follow the packet field order..
This will cover across L2, L3 and within a given header type too.

> > +
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
> > +        struct virtio_net_ff_action action;
> Isn't dest also an action ? for instance, if ACTION is drop, there is no =
point in
> adding destination, similarly if ACTION is forward, can we not add the vq=
_index
> to the action itself using the reserved bytes? based on action type, the
> additional bytes could be interpreted.
> > +
> > +        struct virtio_net_ff_match_fields mask;	/* optional */
> How is the presence of this field indicated if it is optional ?
> Does it need a field like has_mask?
Yes. I missed it.

> Can this be not added into struct virtio_net_ff_match_field ?
I think yes, the issue is not all use cases (like ARFS) needs mask, who alw=
ays uses exact values.
So communicating and setting mask is redundant (also the struct is bit larg=
e).

But I like your suggestion that we can have mask defined as, just match_val=
ue.
Since value cannot live without its supporting type, finding it hard to hav=
e only value for the mask.

> The mask only applies to struct virtio_net_ff_match_value. So it may be b=
etter
> to just use struct virtio_net_ff_match_field {
> 	struct virtio_net_ff_match_type type;
> 	struct virtio_net_ff_match_value value;
> 	struct virtio_net_ff_match_value mask;
> };
> instead of repeating the type again.
> > +
How about encoding has_mask in the type, so that mask can be optional in th=
e above struct you proposed?
With that we get both the benefits of size saving and computation too.


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

