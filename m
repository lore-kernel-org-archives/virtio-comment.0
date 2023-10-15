Return-Path: <virtio-comment-return-7726-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ABBCDB47E
	for <virtio-comment@archiver.kernel.org>; Sun, 15 Oct 2023 23:40:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1766268482
	for <virtio-comment@archiver.kernel.org>; Sun, 15 Oct 2023 23:40:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0EDB598646A
	for <virtio-comment@archiver.kernel.org>; Sun, 15 Oct 2023 23:40:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 015B398614B; Sun, 15 Oct 2023 23:40:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E5120986407
	for <virtio-comment@lists.oasis-open.org>; Sun, 15 Oct 2023 23:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPbXzRi5iQcfsFKKgpfIKB9gqbD/zDDSWcc7iMvtNZKb50aFINtY+s6Vbs4gqZ2CMfAzBWZisJy6789tCJogk6ZbvQNNS6i9Hocqr5aVnh1mEFclAD5A99cUjpGsTADT/l/rHxqxw3VGTwnL7rCDAlh8ySosau7l4puXxruwZvNtZ2lz5fG8L/wWk0EGgEnHNIZL7NjR7OM3TL/+MnnRAu84PK+GbnIhCp9lEyP7mZ7vJSgkHlCy0S/rf7+m8Uc9PhXc+mEn4Mi3hJQmDaet1Kt6w/MCBdQCw9GkdZnqdirbdfwLsX1aZAFEuKVv2paFZq1NCUzrf5lsoGWgDu7Igw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hf+YwNhlV7A92cAUVD0M/s1UYpRMJ30VUkRFUALGWgA=;
 b=KINBBgHCnyhfxzOt+FDSbYMhokjxg7Ql3u/3twol+qLklESf9UjUrqw/e+gmujqvf84OufHgtBUUnHc225a9f4OWrHgZ19Pd9i+1ZJBTAx7TQZ0tXARqWKCIO3VR0A0U5DRQtPn8eANynLQ0m358CsijuE8BVeiIulLtlHyWrYBMuUchzAZhll2BqTRm6aQK4wxI6MddxG4JGvZXxQOFqkalzOHAV4Dd/F/GCvuHTsf6pv7s1e+mVqeAqAX1eVm7liskakmq8rtYhxhx2Wov6U+MW3bp+591btAKQ0e/NshijBGqzWwZSOhgy3Z74geoCWq3PfxwBZIFqVDLXdHilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>,
        "mst@redhat.com" <mst@redhat.com>,
        "cohuck@redhat.com" <cohuck@redhat.com>
CC: "shahafs@nvidia.com" <shahafs@nvidia.com>,
        "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>,
        "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>,
        Heng Qi <hengqi@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH v1 6/7] virtio-net: Add flow filter requests
Thread-Index: AQHZ+N1PLm7B+AtS3kmjPOqw3xOqGLBLf4FA
Date: Sun, 15 Oct 2023 23:40:21 +0000
Message-ID: 
 <SJ0PR18MB447766D1AD4EB868AFAB4F60C3D0A@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-7-parav@nvidia.com>
In-Reply-To: <20231007051443.460148-7-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|PH7PR18MB5132:EE_
x-ms-office365-filtering-correlation-id: f7407bc6-3a0e-4eb9-125f-08dbcdd818fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 iAy0DGv3IBxzz1BJBXe/DrjSwe57aUczlFRhkf6HJEMTKLgqB8vc17j6Zqdlz085fBMOXtKykNpp+hdxktZX+x4jHT5skuDXd6vLwkIX2p4GjL9F7GWp5xb9BSXV5MQMeLrFROklCoVhfhV8Xi465ALxmkw+MmAsKWhCjsoSR5AuvZOEL5qfi2vC3JCLfQBfMh+xnu0v/Kx6wU2LuRao73pB8g0qcZ9YDbhBDiHHZVOXy0h/DaXiEU7x/nxET2lYJR78XtADx6w5WMJl4i9M67VwlVy3KWIEnQK6jjvHmWs9plfDFqZCQgHX3NJE5Yw0JwD7m3/9p05VfurCdanRuPeovI3StKHk0WQIcXrJaS3DLn570/0jA9XO6Kcu66xPzsVy2326DHHBgKh3NJpfcmVqNBkdwcJUo560pDLMnPUuNfRTvflb8fOrlyRs7HTxdSlh21Br81cjPTCWHSts1RQEaQaxgR6vw32yJHt1AbWz4Rs/OVUW+UhEP29J1Inb2o9dKoxZX9rPSc2T36sY9vGkPhq1b/GWxB0RxSz7of5BqHrMbVzW0mrHuzKtnwKqVhMCiJSiXGPg+2Q7t9nI5MHUpmTlzXCtWFJzkZ+GMDI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(39850400004)(136003)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(7696005)(6506007)(71200400001)(4326008)(8676002)(8936002)(33656002)(9686003)(478600001)(966005)(26005)(86362001)(55016003)(122000001)(54906003)(64756008)(66556008)(66476007)(66446008)(76116006)(66946007)(316002)(110136005)(38100700002)(38070700005)(41300700001)(2906002)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?jJL+X9AKDo3gXH0UXZ0rR7qhH37gBtw7CUIKghgmurGq1/4hTqC+yNMfgtIM?=
 =?us-ascii?Q?CZ+b9DDckvj/VtiTdiRMdi/sd1QFI+rexuq6PfdUvDJBohKU1dndpY1DKg+T?=
 =?us-ascii?Q?KCeVgV3NFfl1V4qJb6m4cPN6BgN+gQ6rntusK0gr4D1gveS4gPVeo46XuB0G?=
 =?us-ascii?Q?telP1DQdx2XNX2QFB12ePGRnpVv6PGrPyLusHUMgHuU0p3JTYDukww3lVvW8?=
 =?us-ascii?Q?41FLrdMVZ9TBoFbS+gH4sdjx2/BBMAXFcZZhYNSd0X9tnu7i0Em0InsR3WYe?=
 =?us-ascii?Q?A3IhExVJHyWNMT7YvhavrRTzcMPFIzntAKaZyLIubOj6yaGfJRn39U+781ta?=
 =?us-ascii?Q?+G/PteZWzVH7yAo8c5uzfzApX8rO7C+uLGF/6VXkSyXww4ltu9VBGDeRPZe+?=
 =?us-ascii?Q?YVjooT9MLl7KGT/5dJ3emgCtU0nnsNanN7wotwJEjP8+l6TPr84I70f4DU9B?=
 =?us-ascii?Q?EkE/9JUtSePmFCWvAUjHiaNf/MHoa2+fPYcTlj3oW+z3m7qi43zdd/mxvY+5?=
 =?us-ascii?Q?q68WUpHgDHNMajjNv7wLpUoCazaOw0uQRCvEiKcjQ31sUoK1b+qlXc7Fbwmx?=
 =?us-ascii?Q?ciNd8Li1omq2NjgCNnX3WW12H+2m3aeP4wQ8UZWUCMZdtK47UJB5TCl4sYrh?=
 =?us-ascii?Q?XD7jm5oNR5pjORsQ6/sp2IkXeEAXIuFKYa8tHkvVr1G4Bar8dOZIeO3mDOLV?=
 =?us-ascii?Q?YiUUb9vuUtxFzdsc7YeQcfrqYPgLXT18jKlrTuXxyBjKSW0ll1mscT6MyAJG?=
 =?us-ascii?Q?6F9PKlaQL3aDtSqlCKloQu51rO+7qSij05QWz7grfl6Ayhi41+Q9xbBoN9Ab?=
 =?us-ascii?Q?nvyWxHOaLw8BKNNMyZ8+CJuW2yGWIevq1miFVA4egVsQK0v5Cas12r1sC5kC?=
 =?us-ascii?Q?F5k0e66vulUvSJPWFB4+giHjPTcBaJruyj3nsc7ItVRCJJz8d4GQ8PX5l4B9?=
 =?us-ascii?Q?KYEmyHRXsDQWYwsZEbahFNggGzedjyrYTpvZa9N/vQc49ztgciILFuRN4ysa?=
 =?us-ascii?Q?u6nmPRHPc92WoUfMsGQ/2+afPE8ttR6PxHULHuOcDvk8V6by2hni8xYgV/KR?=
 =?us-ascii?Q?2mn/eE0RagbNQkn9GcivLNBlmyQI77hythshWmk7jeR0SWuon0xxQ2VGS/Lf?=
 =?us-ascii?Q?sRyr/5yiSMHFWJDKJNKVaW4Q2T1C9WNGy46u6h3HL92YAJMAxqC7AFz7i3ay?=
 =?us-ascii?Q?/VSA9z+2bF1S4+RNGwbRhjyQK41Kbv+k7H2hPqBAWR2Kdzij6/GcRCX2XAFF?=
 =?us-ascii?Q?0sk5RsNHXUX/bJeTEaxbQW3T21+BYDs7mjN4V87DVdlCype5fV1/LMhJbh3C?=
 =?us-ascii?Q?0a4348ko2kffpWO9eyWqE5aULiA+cqLMO6mXptd6Nu8v4/FgNLipPLKdZVzo?=
 =?us-ascii?Q?dkBHFPt7wB54KwUmXuFPAJpeEljWtWcbIgP9Pm91hoYqV0JZOnqSHl9XTXYH?=
 =?us-ascii?Q?AsNnQNUcPnLvgz4VNakEd+t6TOugQB2nD4ncA4wFBitU1NZDgg0YFl2pTrr4?=
 =?us-ascii?Q?efSJzGiG39jjS56hTpJRJO63e+IMzCUVWiBEH4QkcTJlIfpCzUxvpvuLkzpP?=
 =?us-ascii?Q?W04jMSrTvHAqjqol+HUE98SyPQm3sIkyKEokXna0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7407bc6-3a0e-4eb9-125f-08dbcdd818fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2023 23:40:21.8412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rsyPDMPwIQIq3kKZ/0TfIeRO5PSVutqzycLxTqyFw+iNO9pd1mxOYqFGABDWgOLEhEbUU9DJhkcgm3trIVOwjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5132
X-Proofpoint-GUID: 1d5mh4tQzW29LI1IPmU2296dWWwF6xBi
X-Proofpoint-ORIG-GUID: j_QIoSQ1tD1C6MpUIkqOqNKwn7dr3k4X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-15_09,2023-10-12_01,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [PATCH v1 6/7] virtio-net: Add flow filter requests

Hi Parav

> +#define VIRTIO_NET_FF_DEST_RQ 0
> +
> +struct virtio_net_ff_dest {
> +        u8 dest_type;
> +        u8 reserved[3];
> +        union {
> +                le16 vq_index;
> +                le32 reserved1;
> +        };
> +};
> +
> +struct virtio_net_ff_action {
> +        u8 action;
> +        u8 reserved[7];
> +};
> +
> +#define VIRTIO_NET_FF_ACTION_DROP 0
> +#define VIRTIO_NET_FF_ACTION_FORWARD 1
> +
> +struct virtio_net_ff_add {
> +        u8 op;
> +        u8 priority;	/* higher the value, higher priority */
> +        u16 group_id;
> +        le32 id;
> +        struct virtio_net_ff_match_fields match;
> +        struct virtio_net_ff_dest dest;
> +        struct virtio_net_ff_action action;
> +};
I think virtio_net_ff_dest and virtio_net_ff_action can be combined.
In fact, dest is only valid if action is forward. So, the additional
fields in virtio_net_ff_dest can be added to virtio_net_ff_action in
a union and only interpreted if action type is forward.
Also we would need support for multiple actions in future(tc flower)=20
so we may need to have an array of actions. Similar to
https://elixir.bootlin.com/linux/latest/source/include/net/flow_offload.h#L=
328

Regards
Satananda

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

