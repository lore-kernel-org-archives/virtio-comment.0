Return-Path: <virtio-comment-return-8119-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA51C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:24:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 96A0E3E56D
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:24:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 76C50986C09
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:24:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 67D76986BFE; Thu,  2 Nov 2023 13:24:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5970D986BFF
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 13:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oalk9NfysQakmg3KtbhBCPVUlahc0BCboL73vBgdKB19Dy/JeMjLVBVNStPPIQf7zQcyOD5jyXC0i1fiDyEKfnWq4EMtnwsyR8jx+q/ETgNNRfbEeLaV6k+IZkr02WhknGTeaaLCM1ewtTjOCrKV5FsZPXWLt4GEsR3YfxJGKg3KNaHXpdDowWCH+rctj4LCKIMxKpBzz4IzUcdoNDGJddWjlekI/eSG8ZYgZRcemchlvi5fSBYxPMkQppg5RvXyoZcLmembo7nKaZPtGhjZ1+MjYnhrzDxKIp+Zp2Ggp9xXGnTQlDJpQQtV+BAoBNQ+d2fMvEKY3aOtrFB+RNb8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCoiCzPNNGlR3Dd21rEFBInyNq6IxyQXL9mMBDIU/OM=;
 b=F5vHKVxthuVw7HCdAnK1Ovt4EUSGLns3Bf/7oS58JM/7X64I/ZaeqGoDc0ePOFyagn5EOtjB9wEfX8DDTKSd8pDfnLFy+HGV6d9p26jWMf88vM/i0LIYnWvKS+9wjivDuyVpGPYT+nbeNa4goZJ8WlZ4GG5TPn3hlckiJPqzBFK5hObFH0QsSA6KVgMHByh8/yBnYFXbZbU7HkMwdHJ6WXbtucS+ERfsiOy4peHULiLyFv28tU7GVmKhAEv50VNVC+Jb8Fm2VcC3lpH7FS0NycGPtSHGMOEXHtseoVakxYnm8BpyHWqBHHKLUD20vlo72o+pRov1mFPxbyCgp3UlNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
Thread-Topic: [PATCH v4 0/5] virtio-net: Support flow filter for receive
 packets
Thread-Index: AQHaDY+SANSHRH/fkUqLCTnPJI8o77BnBGuQ
Date: Thu, 2 Nov 2023 13:24:55 +0000
Message-ID:
 <PH0PR12MB5481F33DEB1DD3806839A9E5DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231102132052.1864964-1-parav@nvidia.com>
In-Reply-To: <20231102132052.1864964-1-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS7PR12MB8323:EE_
x-ms-office365-filtering-correlation-id: 46357f7c-3acf-4b07-1840-08dbdba71aa1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 B4Ni6Y+QhpREDUC4k/oVa2ql5aLDwBgwLce/xSyux5a2b8ffaw/J9tSC07FJ4320YkB4+Gc26naS5sbc0qd9cFETElDWPPkHxcmUgV+YnU80TOXXs2w0gYd/DO1o+h5SpAqElYl3qstjuDHT8JGYq2SBMcBSek3Iv7Lf3aTbO0S96dZK355/8h2tY1Clq5j6/hItQmmPBIaTLAxMPj94+6afoWXPzbWvq96dmmj/UsCtWCHbeqMaRrC1fvv8bm04a3xNmgGhNKIZme0m8UOyPU48pz41mmoEsIHwq8YzVF+MVThpeXTIp8mk6cnAN0kSoCfXu3Zy/ajDmJKZ2U6h4BebCVkkpQ6zWRbz+Kcj2gxoBRi5O6NdWJJerWDjLL6/fGmGj7rXE/2GaY2CppU2j9tpg6qFabSPLJuwiLAzPQRmtsBauy5QrWW442d0aM5Gg/FqTq0e3Dr6DDLSeqVcp6CS3qWGWbUSkFkOSjVxQa3kXcgntedcfL9rzD+xIQDnW3afaeOcxFyq53LhRO/qcc7kXZX0R5J4brbILbkg4Lmvyq9uOHPzb5mXP2uIhk61UxxminxYb1KOUcxIHJlOMdoe/oytOFEjXKthid1WiORU+9k8rPpAGpEpjmAbZn4+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(41300700001)(4744005)(2906002)(5660300002)(55016003)(52536014)(4326008)(8676002)(8936002)(7696005)(6506007)(66476007)(9686003)(316002)(54906003)(66946007)(110136005)(76116006)(64756008)(66446008)(66556008)(38070700009)(478600001)(71200400001)(33656002)(26005)(86362001)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?v8OWkDG8geJMc1pdfuxbUZWaSGQoHBTBTS5VNMJopUX+vrW16HtLqvJf9rEM?=
 =?us-ascii?Q?cSKW5Z0e9idVLIlJp+Ui2fJK5DUeTO/8cVfPhJsBFiJUaPuauXVtJO9b0t9w?=
 =?us-ascii?Q?leq6HKn5A/XFKAjHGZIQooDTxW9zvbWT2TGAwqDnpPLlrBWgpvnfmbiR/ALP?=
 =?us-ascii?Q?MqiJYIlzlUsEjQvEyJOa33ck6DMmgNnn7rfn3Wy9i+ogVmq0TBOz9b/y/pAx?=
 =?us-ascii?Q?YN2hvZCLYFgd3uoitBlGIkQaickAFyIvPk8bnfToNZlFeo4cSM1nuD1fuxoY?=
 =?us-ascii?Q?kYd+AITiUprdBNI5o6suYLX0Dg724ua9Jky1C8qQZ3sDoSIwByPOYboNCp1T?=
 =?us-ascii?Q?AQf6GuIo3uo1FJS1j9PjvKpfAqslryyV5RtTyLTwk186BHYfNW7zXI7bdyP/?=
 =?us-ascii?Q?0Ez2lLgy/68woDk2pnXv2Eq+ha0aXz486PplFF6n5n7xB5/LC+qt/GwYcdLA?=
 =?us-ascii?Q?NIit5HDJ5gf37MQYvrpb81msUaVcpHOFit8hiQJHIcTvgmAwJY9D7hgnHCLf?=
 =?us-ascii?Q?BR6ZzkLh6zi3VoZ59Ab8LqFYN8KoBfIbjWEdwhHd8xP7CPwCrpS9Yr9oA7HM?=
 =?us-ascii?Q?ofQ8il9GArWzSVc7DeVwzA2k09qux9GYcKrTmYwLtEGvtPtqU3NIclwvv4BE?=
 =?us-ascii?Q?81VQD9pqCp4wNm/thX1o3wFp9QUlf+xgbrqPFD9SxR/7g1YltTQLLnDsHpOf?=
 =?us-ascii?Q?FWn2RLH/CjWXgiepdq4HDQsaDJlC69rPX2xgvd0ZlsTut//B1uf0vKfgNmtI?=
 =?us-ascii?Q?bwMdG/wVcb0lZ4G1RleRwoXI3W4iZTWo3nz1pDDVacwpmp7c/XooCrskrixL?=
 =?us-ascii?Q?d+AJZ1pKdvCw1sRZh2df/SfTU//WrtW46OJil2qyi4ro29IocEH0IJZkKLZP?=
 =?us-ascii?Q?AHQkn+3NFVCNJGoiCA6iGQrTZ4td8HaxssKRXnUJs4QqK71+5/0K8pLdZNAk?=
 =?us-ascii?Q?elNdeYPfDlOyJAV1RhOK1ukXFisH2+jdI75RfFp3tCC+GTdsjV9Hq5aiQ+OI?=
 =?us-ascii?Q?lvUdxXsBNZNNMOHGq2EOcMafUF74DPQT5w2x9ObHFKUzxE3CufqGiuy7l4rx?=
 =?us-ascii?Q?JNDJzQzdRC6V/RXGiATORoLSob3UKbr1tvxzEiDwRT8zoGCUjKfHP9y1eMrf?=
 =?us-ascii?Q?vLQc756semX1+UPv1Fak4tjCKciY0gaWr5DmMykrG+SYVkGAQKZY51XBHRGM?=
 =?us-ascii?Q?v46pWUlkNGMPzVBGNZ0UklqDQr4xM94kLrV+QpnMbjsP+8ks5f3n8FZjLxsn?=
 =?us-ascii?Q?n+WmFQTF/ESIF1mA5oE5Ag74tae+gnT+e598L5+GVIew9AHdt8ctAKbePlxL?=
 =?us-ascii?Q?SpHIa1VJSO02HGMHPFQCLY+6ItqUoygWY+qAdZEKqj9HebYVchcOPQUMseUQ?=
 =?us-ascii?Q?IE0dH+MAQrwOO64XRxvF44/qBUP2IYPE6ZutCEyWDXgRBVGDRkZQcjQZmIMm?=
 =?us-ascii?Q?6Zvjch2wzc4DeJRgUR7UMLUajFNk3LwyxN/NZXGlz/bATsrhzDkDbzcoAgBd?=
 =?us-ascii?Q?vrN9Pmo713nfKjLJ/UrQoAOL53rGwJtWSscAuPDsgQVR7ExnAJMwD/04v+Qc?=
 =?us-ascii?Q?zPwXl5YlxkfBdUR414U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46357f7c-3acf-4b07-1840-08dbdba71aa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2023 13:24:55.5673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u4myM1PSY4EOHF2HaswPitZz/9XfrGndxNPnnBax7Q9nAbQLRc+nKbl17Fv/8bUNnhnfyGTs6J6pAv38zCwXtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8323
Subject: [virtio-comment] RE: [PATCH v4 0/5] virtio-net: Support flow filter for receive
 packets



> From: Parav Pandit <parav@nvidia.com>
> Sent: Thursday, November 2, 2023 6:51 PM
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> v3->v4:
> - removed left over dependencies of flow filter virtqueues
> - removed partial sentence
Please discard this broken patches.
My mistake I sent my internal review version.
Sending as v5 to avoid confusion with broken v4.

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

