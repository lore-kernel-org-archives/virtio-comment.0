Return-Path: <virtio-comment-return-9105-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD9FC4829B
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Feb 2024 03:43:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A11512B039
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Feb 2024 03:43:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 70C1F98635C
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Feb 2024 03:43:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 56144983E45; Mon, 12 Feb 2024 03:43:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4792B986324
	for <virtio-comment@lists.oasis-open.org>; Mon, 12 Feb 2024 03:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeRef9Rr21J++kS5dvrrbtGMg1TEZbwF0FovhUYdpz8TNSlaODYxsmpsNyBui2LwXsBSKnplrRXM4U4TNGi7NIg+t60qZaPMr9Dir2mklMlEPaOweh/mWn1/PNQgmZiKQKPwGp2aPFRI7L7GlmbxRXFQVG0WSme1E1e4g4MG7n7Ry/B8KRMNl9tImwJzNxRbh1+eS80jmOfXbuY47VDo2UZpvKSoz5q7DRas/Oy8fw+QVWom9y0QIgH9e8gEbgfAYhZ2aDFtqNKwoXQfAA0y0L1PziurEe3WdgoA1V+m2t/U1LX/FSD7NqO0lMXT+UgCUqL2yGEliH++U0DhF8ccmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SewavmVQfwsEikKhEub+7BPjNuFZdL+4rDASxBOjjWU=;
 b=JNn+DZmhQetmzmiVgnU36sfic2graprpjYYxj+4OHs59pRY3NaNVutgEOJOjAQ+iq/QUPQz6TjYuZTO8MO23fWZ4bOXmanEWRBp8L32iA1ihohWQABRo0+3xAqjPazI12Dex56ElxbwV3sJaz1rcQmKNDxRScZr2NYqHL4AroH3ORY5fEACanUCXOu60GaaIuiXxgrIKaSLFjqE+akoW5yBvJiPvY7U0XMon6WD2HeLStvKgJcpY8tXq/FxpoONpYacxJ52E4bsVLRiyVwwNxxPbUlLgg9BZmn1E0lhK8gsPpAL1s1RlSOCOlmQPIahTU9ZtdBvEkNq506QoUsZC7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH v9 06/13] admin-cmds-resources: Add device
 resources admin commands
Thread-Index: AQHaWZaxpUeih8ZclEK6LmCN4CMK0LEFi84AgACL0iA=
Date: Mon, 12 Feb 2024 03:43:41 +0000
Message-ID:
 <PH0PR12MB5481D6CD19ECD0C1C93FA058DC482@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240207072336.477606-1-parav@nvidia.com>
 <20240207072336.477606-7-parav@nvidia.com>
 <SJ0PR18MB447732E5A14646DEDFED585DC3492@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB447732E5A14646DEDFED585DC3492@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB6231:EE_
x-ms-office365-filtering-correlation-id: f7202518-607a-4c8f-7cf9-08dc2b7ccdec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 LDDJMxclLuuv+X/GSe8izhkd+vEDVHpgWpPQTlWbrjuWyNNmOlygUQuZklzKtzBRsmZogY70p0zmAlvyHSJmiFkU7cZXu2ByR4wckiV5MvpiZmCbprCqKXlTVCknfwoXLRr1H/hZ4AEtG9eaUemSLKQagUSL3eeFv9lJ+bqNzdglEbqmagcS+CLg1b02bToBLQFrOJc9z6oKEXVr3YU30YqW832NiyaLT6/BodyVHYAuOzEJS5C5gL85XIGcGnHFVWoGNNfYmsZALegIBwZ4mFsp1b+8Z5DSOeN1nYMr8lX8vOKmBVVTGz243LqBFFOyly5xn5H092wjW75ceNzMU0xKU0RSyFs0fvHiFNgXOfx/XrlIKI7pjO8DPYYKpVtsTKozQxHuQmqnbVTLgxLX7u+Vq4WO15FCGizJSzwNnD0uNlXB6BERjOa//6/y238R/L2yXKmB0Nn9GKokANBsvzDMGfZYsZT0XUGcD1PYH3t7Q4JlY+g2KL3WklAVaal8SpzlwU0JOY9Umto64Zhbx8vQ0Ll8WCZRFf32LYiYgCdUFc2bKSEFs51XXTiZQLhl+l3F3dCW5EVb+S1pClB5OXfsV8rBTuhklSOLcfceJ9sY+CZi27cHMQEkBazHuagL
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(376002)(39860400002)(346002)(230922051799003)(230273577357003)(64100799003)(451199024)(186009)(1800799012)(33656002)(38070700009)(41300700001)(55016003)(110136005)(316002)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(86362001)(52536014)(8676002)(8936002)(4326008)(6506007)(7696005)(71200400001)(478600001)(2906002)(5660300002)(38100700002)(122000001)(53546011)(26005)(9686003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UXAKePt+KE4ePWDmQwSGxirYJa7Yh/MAduDXF879GkiQ2WaxhflcatjUpr5M?=
 =?us-ascii?Q?mMs1wVmfp0QCEUjAdEs3VHh+Az5BcRQq9/qHdAoV0q/n08ZeNu3Wx1gkY/Iy?=
 =?us-ascii?Q?5B6fR61/cba7GP09ZXXn4aojhADi5qPeGKvSd8K3au7A/jvpa1gNSZmAXi9I?=
 =?us-ascii?Q?ozQvdAZ6eTMzNGiB5lmSXpcjQCU5WBBVfsT/yudxNJyaye/wr0ocAbQ+0ny5?=
 =?us-ascii?Q?GGNOcZbgDP8Cv/E+wgX4Ri+/SLjOF6c1C0GWU6QstoR93Vbht0PMAqi66i85?=
 =?us-ascii?Q?MCeIeBR+mdvJUdse9fZMtTxlyHG4qHjWWC7cq6V8UIt+Tgy5oMm0myEa29UP?=
 =?us-ascii?Q?qJ9kGl6Wb/U9RPxOcNROQE0g4A3cYmHJru4PH/m6j+q+f/vuq8yVD75P8hvJ?=
 =?us-ascii?Q?f8DiVN5OD1fOJL4j7CcpHuwXaA3olktJ967mLwOnclMBWh4BCBBiT07Wy1hy?=
 =?us-ascii?Q?CRYxnYicq2JuwPRDNIUO48mV59c5D9EcCJ9K7MtQS9cHJ2EdwkAYa/5i6NYo?=
 =?us-ascii?Q?neEO2i94T39D1VUdwjh5XCCCDOIBwt0h8Lhha4cN/1v1fUkfVgnPkwYDlMRz?=
 =?us-ascii?Q?RYPZHQGFlLwSk+kRUTXNjR3YRriVOc7Hxux7GAFSlS+Qgx3CZYAWtjaEbyMy?=
 =?us-ascii?Q?DkqKXV40tL1O9PjE8Mcv80Db8rEelNBK5tq6wsscAqE+CRbyrnb0IRcjVzAx?=
 =?us-ascii?Q?lfirVpAn8RLNHXdKt/ApNbPf4GpHULauvDoinHWqiqO6RZIXp9KWbYbpAP/H?=
 =?us-ascii?Q?7jQjQ3utQlNK5vPw1/thGCz04GRy5oafuC8EcmC+w52DBCpcHSKR8HtSqPIn?=
 =?us-ascii?Q?w2ruW8u06mJ3KQOv1vA5fIHP6ZgcxZ+i82NDGS3IF1tWA1G7DLSZgLfWRw2z?=
 =?us-ascii?Q?atTQqZKf51jU0EtmFYO7vgPb5fsUEL5QZLOoKRVxzTKii61K2ZsbHMh5lSIK?=
 =?us-ascii?Q?sybrWhcA0xW+C7g2/hcSYiOvtBqq+yUuxugkw4WvGRrhR9HqiygP1f56/aPi?=
 =?us-ascii?Q?NdYDZe3hrweYUKlvL5AZJ2W7eIbQTU5ohQRWoW3yVKsCabcvD2f0kvF5/e5s?=
 =?us-ascii?Q?rGNcePjJAUkLlrx3lElE2+Sb/mLn+elqXerx/o9fg5dSNYPgswXH7TXl2Avl?=
 =?us-ascii?Q?NNsSWD+wRA4bfWK016YxiLKWKWCK+B74o+D0bTLJow0wV6xmedkU5AdDyIxf?=
 =?us-ascii?Q?qhjgvtRUEg9ES8RnBK8F/3JmReO+sqAnB7Y1sGhL9sllOANhA3Uo7VY+UZTS?=
 =?us-ascii?Q?72+3UDBPZXfVVQWROTpKui6KD2XB9e+Xuj3l/e3OMSMPiUQeGfrDvZ3T2bUV?=
 =?us-ascii?Q?UGoU5Mkldys1mFdFWBNIpQI5xQP+fVOL6Vxf5VKaW0E/EWrA65Mr8/XPuRWm?=
 =?us-ascii?Q?+m06iyfEqjViI3Dxqy28YvedlkwAK0xuveHrZDd3xYd4y0BkudjaXoKlDepr?=
 =?us-ascii?Q?YplKEAg3Yac+CuC4znYFIUijzJNQefKfHjn6Nv1Xz6a12rWU9mmYdZR5yJJN?=
 =?us-ascii?Q?jSNOnE9745vRVgIxDEcRlOTugJkvL5V4yTrbro66IRAqf7ZowI8ZRM0k9wGT?=
 =?us-ascii?Q?pQ/rXMJdHcjtGnJ1qk4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7202518-607a-4c8f-7cf9-08dc2b7ccdec
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2024 03:43:41.0267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: esgLFa/Y2ZM8E7Iy4dnYSSnhsWKDf9bc768VlQLp2z9zi+nihPRnmt+tFtRt375L7dp7OkTikOKR1qRYSjo1qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6231
Subject: [virtio-comment] RE: [EXT] [PATCH v9 06/13] admin-cmds-resources: Add device resources
 admin commands



> From: Satananda Burla <sburla@marvell.com>
> Sent: Monday, February 12, 2024 12:51 AM
>=20
> Hi Parav
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Tuesday, February 6, 2024 11:23 PM
> > To: virtio-comment@lists.oasis-open.org; mst@redhat.com;
> > cohuck@redhat.com
> > Cc: hengqi@linux.alibaba.com; Satananda Burla <sburla@marvell.com>;
> > shahafs@nvidia.com; si-wei.liu@oracle.com;
> > peter.hilber@opensynergy.com; jasowang@redhat.com;
> > xuanzhuo@linux.alibaba.com; Parav Pandit <parav@nvidia.com>
> > Subject: [EXT] [PATCH v9 06/13] admin-cmds-resources: Add device
> > resources admin commands
> >
> > External Email
> > +
> > +\paragraph{Device Resource Query Command}\label{par:Basic Facilities
> > +of
> > a Virtio Device / Device groups / Group
> > +administration commands / Device Resources / Device Resource Query
> > Command}
> > +
> > +This command reads the existing resource of \field{type} identified
> > +by \field{rid}, which is previously created using command
> > +VIRTIO_ADMIN_CMD_RESOURCE_CREATE.
> > +
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_resource_query_data {
> > +        struct virtio_admin_cmd_resource_cmd_hdr hdr; };
> > +\end{lstlisting}
> > +
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_resource_query_result {
> > +        le16 length;
> > +        le16 reserved[6];
> > +        struct virtio_admin_cmd_resource_attr attr; };
> > +\end{lstlisting}
> Since this is not fixed size, what happens when the write buffer allocate=
d for
> this command result does not fit the result? Does device return specific =
error
> code?
It follows the standard admin infrastructure to allow device to truncated a=
s I replied in previous email.
This continue the backward, forward compat design already in-place.

Returning error code would break the backward compat.
For example, old driver with size X bytes, and new device which is capable =
of X+Y bytes should not fail the command.

> > +
> > +For the command VIRTIO_ADMIN_CMD_RESOURCE_QUERY,
> \field{opcode} is
> > +set
> > to 0xc.
> > +
> > +\field{group_member_id} refers to the device itself to be accessed.
> > +\field{type} refers to the device resource type.
> > +\field{rid} identifies the existing resource of type \field{type}.
> > +\field{length} refers to the length of the \field{attr}.
> > +
> > +When the command completes successfully, the resource information is
> > returned
> > +to the driver in \field{attr}. When the optional fields of the
> > +\field{resource_specific_data} are valid, for each such field a
> > respective
> > +resource defined \field{fields_bmap} is set by the device.
> > +
>=20
> Regards
> Satananda


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

