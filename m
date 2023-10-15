Return-Path: <virtio-comment-return-7725-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34A7CDB47E
	for <virtio-comment@archiver.kernel.org>; Sun, 15 Oct 2023 23:40:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1D5D745B2D
	for <virtio-comment@archiver.kernel.org>; Sun, 15 Oct 2023 23:40:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E901C986448
	for <virtio-comment@archiver.kernel.org>; Sun, 15 Oct 2023 23:40:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CEC4298614B; Sun, 15 Oct 2023 23:40:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BAABD9861F9
	for <virtio-comment@lists.oasis-open.org>; Sun, 15 Oct 2023 23:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0Af2uQ/OeZSv7lX9QqEojoJQp+BhXPMTDkNw44egHZbhlHlLMgP8lYkRBJIR6s3owDEhTbEtw1X5is0ksp+D37bspOGybqeT8KYqrp4wFnlYTh2e6zqYij5t8wxzLkuQSmGsXGoDjI4RobzmuX24AQ5ccYu1yR7zIUU2RAur71TMJ0rPC/XON11vz16zGF3r4QhlF56FdKyXKKpoNlO8uhA7wvBpWoGMK/9TCFSVULHGaN06j2D6jlQHK6Dftrd50V4XWyDfm4Vm3hW1LT+hOPgMbMdgg+SzRXQcIqywS2HQ5243+pOf+INmG0x3J8BRZB0EbzY1esD5HjQ63zl+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtXqbl1WzL/v+O5xpjJA3MPKwSZ+Chumx6ENIduHb/w=;
 b=Zu8mBujmMC/gi425h1GjYXYSNTdLp+GiMpZYM1plZM4MqLcnKwVsH8648Lf4sZ7Gi6fZJ0qigP85fsfbd0s+YcEZv4FFKG1WUNhTCyvWcYJVDz8J76ls0V/fPuIHXJQfgkX7dA2mWwdavX0yXxB6RmZWz+eRWCZbg583YGjJTMw7xBpJ4VOAihq+gNBEI6o94LeLSLRU8d08beXIisnjx1UYimyXKO13eUf0ikUVQIWRmkkv4p3Iv+tuZHjJyuR0DFWfhq77rWg6G44NGOpg4LMELu9jLExcR+VuQfVxpe9JdJ1brhjc0ORL0XJWqBA0IpTNyvpQC+o/cx58sRM5dg==
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
Thread-Topic: [EXT] [PATCH v1 2/7] virtio-net: Add flow filter capabilities
 read commands
Thread-Index: AQHZ+N1JLOJqXG++dEaY885Eol33c7BLervg
Date: Sun, 15 Oct 2023 23:40:15 +0000
Message-ID: 
 <SJ0PR18MB447755CDD327B238B8013B11C3D0A@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-3-parav@nvidia.com>
In-Reply-To: <20231007051443.460148-3-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|PH7PR18MB5132:EE_
x-ms-office365-filtering-correlation-id: 90023eae-d502-457d-2202-08dbcdd81584
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LsnRoVXwfVvhsykbP2RHcEmJ3YUuyGo0nXsv8UB6YoS4vp91wo3NfrSb3rqmzJZKrkfWEKVMKIhI16y8jz7JhBEiUt+XVw6uokcIngjOeHA0OXEJ7Ez3+i3mXhHvVlKSJvL58g3y2jDhUmLGp7BTfMQ+IK54dTgag/ExLaQ7heTUvy3/a4nuGPmG+qHzSrLO5Ui718ABnzsM+OFfbmgMIBgvsDleLEjzEdvIlbV2Ui0SLO02Qcn0syp639LPg3XVqNapsZaoZVbQpXD5uyrLaMEycm4AwDQd7n19E4YJDikXyksuB/Snh7+g3TjuV7uQULmspHqUKp33L3cRgKoaZNNliG9DxiFogxQqTxirzCFSETKSqg96QTHRIKuFKvMIOSJX8D7lX5lekVF0EeAETe5AQ00cqpsPjliI7geFqiwLfkWLMh3r3tXpKETEKsBah8VZlZEY7nt8TeUeKyrYkDrA3ng/0E9Hm3kJx+8G/Q9AJ2ddyY+el41EQ+xI+l8jOQolBPE2hCTF/6y+eGp2RAuIaWfWjoC9qWTAA1BRHb9mv7SqzkvktU9Ae5rTZIznP3fpGAkjtxdIEMjizq2RgZbR1qqm8JRH0d+VUjqm+jZqsRBfTAKwpNT8R9CTzm5l
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(39850400004)(136003)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(7696005)(6506007)(71200400001)(4326008)(8676002)(8936002)(33656002)(9686003)(478600001)(26005)(86362001)(55016003)(122000001)(54906003)(64756008)(66556008)(66476007)(66446008)(76116006)(66946007)(316002)(110136005)(4744005)(38100700002)(38070700005)(41300700001)(2906002)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?+S5sRKNvMhu0s8kygqk7yU02kfNNED+lMYBYOy1mDtgoYKwHt0WoiLH8Snsd?=
 =?us-ascii?Q?Pa+PQcQisdpe0U2NXB8nSeK/H53XVALkDt2JDTCvvTJ7ei/hcWxpwyb7/GH0?=
 =?us-ascii?Q?VKS0KzgOsRJi1iJlvJaG0Q2imW3Wfus+0KpRdpLsOXrix6PCLVVD92mknE1K?=
 =?us-ascii?Q?JS4Xu57FJAkLxpr7FUl2CJ05D8KP3dL+oaXBT0EQcNVdXjXNOThF0W0KkVJs?=
 =?us-ascii?Q?5PzleyGOqL9k09HGIBFGQeGnU5pVnIr0j1po510qZm/yr40o/EhoZ/fpD2HL?=
 =?us-ascii?Q?+umA1dUbztZWmC6yF6dPThW6YEO2E7eGAt0MWZ+RwQIjw1nnqj44o5OZRJ66?=
 =?us-ascii?Q?iJjpZWnzHMl4+ctuYBf8MlPOmn1KdNXt/2m4jRjinIu9CBSCtAz/2tLYjd6C?=
 =?us-ascii?Q?y7iHuIofTab1d+krKAbtbfcnQKwybufGRtXJbe6oUgx9PT9c/SmvHpv3A4z9?=
 =?us-ascii?Q?JiFU05Spn9vO/YO/cK5u56LZxBlMeXHKB81zoJNARKFb9ViYKv8EzTj797xP?=
 =?us-ascii?Q?0j7/9d6iwnxtfNoaAqLvp5dvbWE4wm3ra7CeImXqwWblusJzILewGIpUBhDi?=
 =?us-ascii?Q?3Utc/pQ62196oOZlXJshoqPbXGpnh+QrNG3q+tBmWwqYtkCUsDT+reypHeO0?=
 =?us-ascii?Q?tJCLhu/lRdNpvhjz89xKa0znsQfvtNz32UiWC5iUU6grok/cjE5LqUPQMD8F?=
 =?us-ascii?Q?Uq9wIpz4I9YTrBSsBvfHOnxqzTxkX6tGNH9IQYE5u7F1N88pv4z8xeL/F8/H?=
 =?us-ascii?Q?njdEAQgpsDoo/0bz5ou5pwq3srTrw/r0lYOsBPV6D/zlQIfe9KqXZfQzF0IK?=
 =?us-ascii?Q?KCVdDd2KdJWezjYXKfu6fkTHh4yoA4KYrTXjZXYYurfoqYFPCMMO7EobUg0D?=
 =?us-ascii?Q?ZyCEALcixb1Wy8fi7MtAlp3ad7LXyH9qnDWT8wMvSQif2OU0teN4kf3fSoEI?=
 =?us-ascii?Q?+5RuhhId+4fAmESVpPOy40KWTJx/kuGlryKayNA94Z9l1kmVI3EFuuIEq5zs?=
 =?us-ascii?Q?Rri5r3zOLYJvzpAS3hqIWyMt4QbIPUSnq61YU4dCLhC1gbDoKEw5LNhCosWu?=
 =?us-ascii?Q?miifyowPpjYkFOTg13qJWBr7fm0n6H2T3AdnCBnD8bnMc7piVtYwEeJ1ZuLR?=
 =?us-ascii?Q?wkKXyIKyzUqCQ1YZhlQBiYBElzYLIxQWNJe++xnWrf9skFnKFLJeRJlrGK0g?=
 =?us-ascii?Q?mopD97GG3yrVufIWr/jdsD3/VPq/cT3kB921sdi1vwdra1b6ZpFvmVN6Bd6x?=
 =?us-ascii?Q?IWNLE1W3X8aku/eNWpNGc7R+rl5feHAID2tv9Zd0ellH9lyK46Pwe5vak2At?=
 =?us-ascii?Q?vRIM1rNfO4fg62i2uHeAI0BafealF83kXsdok4yYt3LTcidq7KEHa9MsAzvP?=
 =?us-ascii?Q?5jeMbud1CUPWXlJZhSBP1OLvyLlUkA04uqFAhbkuR3um5R26nFPpG+J3dK1v?=
 =?us-ascii?Q?0vmBLxO4YxOl32tpTLxfCJcDW/cNwtK1cXPA+G6vzVmbRrhax4qe/74oJ181?=
 =?us-ascii?Q?TLzY5b7Nykm9ONNp2AoYV3bff1x/bSmsEJa9TIi9LCOj265/kL8Ih6wPwUvF?=
 =?us-ascii?Q?TZyuhuxBGnyGMdHUwylL2VEDeZrSU1ahyxLsGwrb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90023eae-d502-457d-2202-08dbcdd81584
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2023 23:40:16.0204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nd9G/KkHttpn7XhmUecIAsHsYd72KEIVCFnpCBqpnpp58Fys4EC4ZcjGp7CgXPx4yq38t8GndnaH6zEs74urBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5132
X-Proofpoint-ORIG-GUID: LROkhSUPOTpieNnoIiKsMfd0Xt2Z6-H7
X-Proofpoint-GUID: cib-SuAhr8ZYBtrmJXmUmnMpB_KMLj0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-15_09,2023-10-12_01,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [PATCH v1 2/7] virtio-net: Add flow filter capabilities
 read commands

Hi Parav

> +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields
> +are represented by a bitmap in \field{fields_bmap} are following:
> +
> +\begin{tabular}{|l|l|l|}
> +\hline
> +Bit & Name & Description \\
> +\hline \hline
> +0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the packet  \\
> +\hline
> +1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet \\
> +\hline
> +2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
> +\hline
> +\end{tabular}
How about vlan ? if a filter selects ETHER_TYPE as vlan (0x8100),
How to then match the vlanid ? I believe I mentioned this in=20
last series as well.

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

