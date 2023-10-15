Return-Path: <virtio-comment-return-7727-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34554CDB482
	for <virtio-comment@archiver.kernel.org>; Sun, 15 Oct 2023 23:40:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9AF2D72359
	for <virtio-comment@archiver.kernel.org>; Sun, 15 Oct 2023 23:40:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 91B2A9865B3
	for <virtio-comment@archiver.kernel.org>; Sun, 15 Oct 2023 23:40:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7C2DD98614B; Sun, 15 Oct 2023 23:40:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F61E986428
	for <virtio-comment@lists.oasis-open.org>; Sun, 15 Oct 2023 23:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMyA9fHscJPasB0gSc3kQVfkIiLOn6LHBnAJIa09E5o8g+QKsI+pWpafawU9spVFdBCF5KwPYY6dG+3chjNoYfyB8Ps2/QDI8OAMjy1PS63WhcOgSUAHSJvXR5eAs/GvuSD2pWRiOGEJe57XKsiLMT78f5Z3cmuzHop/8mvAlJNPH9xCVkd2ADCIx+5bGsOLEgoj/sx/cP4zHUzLoZFIaXbV0AGuTACrnKIvHvdF5mMDPpjLuxgo74WBKSw2NfV/ZgyewJZzbdP+ZJYpMm33WfpT9HrNWq4Bu9VhX9vRpkUyfLahOcEHTK5CkEziDgvXiLcE23Kt/gDi50sxl+aYOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOQO32zamxq0ZBkV1vpYpfkbeXy+K2dcbwef3tJpHN8=;
 b=LFQo6XeIcgc0vafMCCGkgcUgrcKK+d2wlJtqp7gJ52nUqyrz2gHDMw+sIL7bLBIFpesAW2j2dnuqmP4QZOBBA4yQdmJMu4hdPfvSnAGAe72XOBzH44huDCQW5t6Mxc/NHmKnx+x2xWaPHgYd9WA/lb40J7q7MeprqyXWoAfNjKPe4f+Qn5Ifs5NdJcToFLweSrZU8TNO7qDWZOhsNUD3Ae5d4GfAmsQTAQyejsNAu4LNecGXewDM0vtgRkzhH4fnuJtNbs32m7c0qFDp9vaf/wLN8RVTp0YdYFGsau3d5C3HJXizM9Nzj9kPbI0tWissaFUrqBW11rirfPflywBuQA==
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
Thread-Topic: [EXT] [PATCH v1 7/7] virtio-net: Add flow filter device and
 driver requirements
Thread-Index: AQHZ+N1ZBGAHEerA4kCCxMphUSLR9rBLiIVA
Date: Sun, 15 Oct 2023 23:40:25 +0000
Message-ID: 
 <SJ0PR18MB4477132D1F1D21178F4BC238C3D0A@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-8-parav@nvidia.com>
In-Reply-To: <20231007051443.460148-8-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|PH7PR18MB5132:EE_
x-ms-office365-filtering-correlation-id: fd2acf82-0576-4b98-3939-08dbcdd81b24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qOzAAz4xnxBMjbl8l/VI7bAuk/33OtCMRx0SJrh2szRUXoznRHWByXXkeNAGnKmLyjOubT3prpKddh3jKl8hYKpNsw8gwEV1Ai9tR0OLGf8rOvwGT4L39/WcWVzOamtqt1Jblr4tveAOVEzw0flcMk2URVUjR1S/zEbQtBZ7g9IZSKRACfb59cG8IBGRFG8Pmaxnth809gVbGRFNduOd7PcWmyICXFVJ+8kez412KJpcmu8cnJboFShl0lhCRavbA1riocuRd1dnc6YzDGzqjPzYMsrO9SFWzUW7juEmZ0ZMiGYZFGOvBKbjIpXer5ZyP/COLno3tQBw2dOF3k2zLAUoHc1quS5BpAz0dNDdT50Mfdlla0bZDff0akrFMsvfJqo3xZQkusahhGwPkOXqdjIPJ/MgeR6eZlVetVfauTsnMbdSNZf56Dmyl+V7K8xuW2RRu01b1W+XFiM9BnAKodGrrDZSVDOieqBB4cjVPjiJ2TMyGdo0rILfba2k1x8NhMEMa0qAaLDWMPPSGpb3r7ZToNQ6o+LJv1hS3V6AFPBnctyLi2vQn6TDB6moL54vlru+sBPdFRfvZrTgZbsOFgsSV0MVucuuaNyiA+qXMc19io9V6z0pj3omrjd5GdxC
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(39850400004)(136003)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(7696005)(6506007)(71200400001)(4326008)(8676002)(8936002)(33656002)(9686003)(478600001)(26005)(86362001)(55016003)(122000001)(54906003)(64756008)(66556008)(66476007)(66446008)(76116006)(66946007)(316002)(110136005)(4744005)(38100700002)(38070700005)(41300700001)(2906002)(52536014)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?kyxJtFyUJI+8wuSH4MB+PdfWBL8kGU8owgI1rOBBmUa7ebQWpeYee2A8azQD?=
 =?us-ascii?Q?Ln61QFrUYh2oN/3ebk3uOjUyVw+s52n3QUQfwl1xqCOskEaMeJWzfQCns6/z?=
 =?us-ascii?Q?ZZd55sXUzCGJeoCkYEAD81JUmdlRq54n9tBDoNZwJageMaXoAFY9UjCi2cIq?=
 =?us-ascii?Q?yDiudAmZHDOu3g1K14K8Zm1CD9OVv+9pI4IiNHO12kSIR8GfSnkL6jJcFGMW?=
 =?us-ascii?Q?R4691Dsus7AJF7rT46JISnzacwgrWp51ZCRGx71dhvps1Ri7K2Eh0m63xJBQ?=
 =?us-ascii?Q?3Z+8AgOBKgrzQOf4gtPlMZ6Mt3oNFb/K7XiuaDSODnvg55R3wO8Gfxp450Fd?=
 =?us-ascii?Q?CYrAaOtPpNNT/EjAFqBuanEi69TmhxM14T2vEQQeqN9/lDHrheOgmahvwwVV?=
 =?us-ascii?Q?+He0dO7Inm1SjkpvOICvgazNQ7rsyvSE+CVolODQhQ0bwwKCFdoW6o2hDK+D?=
 =?us-ascii?Q?iRxmCoNVU0+1nVcDA013Gnp9RcAes1kEDWBH1xjytGXbzniU6541kim82hzC?=
 =?us-ascii?Q?akTrAv35N7DcOkURQcU+CPumFz1D1q1BN1oPgwbiAkC+pj3QfOMXfZazsxj4?=
 =?us-ascii?Q?wos0Kb3czI9Btvsu04zwKd72pR4XrBJzWbiVMab3iN781AyVbPYvjAOqQkR5?=
 =?us-ascii?Q?DdcDDKzf3MTSCPmNKOTVYoYOSJ4/DsGDWd4esJcyBVuGFcRAVuoIrRWgtS9f?=
 =?us-ascii?Q?H40U4SZTEOJhIWxwc5hqbct+LS4XnS1HeyjmiV/99va+0iGLSAciW6n0P6q7?=
 =?us-ascii?Q?dhnpvQ2V2EFK4y+5WgzJBxd4cpdbgywFdunDijK0eN/uQ1clykOj/n0fPjzH?=
 =?us-ascii?Q?+AfgOhzt2pBCj/fDBDoJYlp1av0fAvAU8gSKJzh0qhMlO+gCOaOMrdZntkKv?=
 =?us-ascii?Q?E8/2fj9uEdyfJERr/rbQ54Rb154mqKH7XrVJxCZVfKvlR/G8d9Ea/hUoBDB+?=
 =?us-ascii?Q?ouBlXhmEXv2SRUYXkJwC48SJkm6vYWF9vdza3aSJ8IzF/hxVnskB73pz6eC5?=
 =?us-ascii?Q?YnEbCU6I5f08ZElFJ9jVDxGEWZ6XcNFxuJEG3K/ZDvARTc2sm33fsppdJIaX?=
 =?us-ascii?Q?H/nQ9QQ6d4W/o8xctNus552tUJBnHiLf3PHDY3Fzmp38FBRMi/Cbf797YAtn?=
 =?us-ascii?Q?2gM+oRFZE/8YS/j9ChHMXj3rGZbrr3+lJ1DmSkKlnkwG6Ss37OcRMz/mttyh?=
 =?us-ascii?Q?ncEnVrRPax7UdsOVlkddiaEhGRUxUaUfjS+bJ+uZCPfzphVXSI3D5zWvCUJM?=
 =?us-ascii?Q?+kl7gEXoCRjl8gI11jQIS+vGnG6/qGNP+BoichFIVm622qj5LFtrm6SXswOY?=
 =?us-ascii?Q?zI8WAddZ+m+ywb9XoLILR6OzyMJStA3o3rIeWiThepg5iIhkOQ7ZxFQH/xE7?=
 =?us-ascii?Q?jWeg1PhmLpR1HZBRpjis8YEIXOoXbbvTZyuLzzrCD7PaJkwTf0vYNyNsAdn1?=
 =?us-ascii?Q?FgrtYp2WGTGAROmsilMLZTckT9k5yTPa2FDMdWTOQmBdpKKkRDHq2ZOclTRP?=
 =?us-ascii?Q?h5gVcDoGeluU9EWDK4pTcM0jHhNs/pOwL6crkTE7lKN8enV0fvcnD/bTZ7Lx?=
 =?us-ascii?Q?854Ry3sA3jMsV9wxdo6LaZEAgokTaL40Zzp1cD0k?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2acf82-0576-4b98-3939-08dbcdd81b24
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2023 23:40:25.4834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ienXr86bsgZ2CjelLxNe6ZcNdmpTMTdQkJ9yPqo4ab8dNFlaQh/9noLDZqRZdTo6P7NaI8VlKRTR1RMy7pVzUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5132
X-Proofpoint-ORIG-GUID: Zg_thZGYgxYN0gO9SPu3I6lY2sE9MsYf
X-Proofpoint-GUID: TTWuGmZZJyVVbWt0BsBdSG8E7IwIY6zY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-15_09,2023-10-12_01,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [PATCH v1 7/7] virtio-net: Add flow filter device and
 driver requirements

Hi Parav

> +When the device matches the flow filter for the packet and if no match
> entry is found
> +for the packet, the receive packet processing continues to next level,
> i.e. to apply
> +configuration done using VIRTIO_NET_CTRL_MQ_RSS_CONFIG command.
Did you mean to say that the device has flow filters configured but=20
no match is found for a packet? I think the following line is confusing
"When the device matches the flow filter for the packet and if no match ent=
ry is found"

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

