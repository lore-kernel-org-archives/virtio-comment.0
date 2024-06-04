Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA84B6FC3
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 04:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717475368; cv=fail; b=OB8vYw4LCOVp5hGMFNRYepN0CEn/BOQzzPECuSBNh95L/9mO98YpyOLCOBuKwvvD36E4Pw4uHLkiQWouKJ9kQJvPOa/Jo3jJLUNaStYrjBa3vlu9YtawpwE2DopxUNf6JONuu1OqIyXZj4+VMQqheDFQ6Gk5ynNJR5xHb71eI+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717475368; c=relaxed/simple;
	bh=lBCH3m9vCZgHd0jSWwAPcHgrYb4GaXSljHBfH4b4QZA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jatgLrbYdiZlj2WuIGg6OX7g8Mfx0OfJxd5E4ULeD+6UDeiFq95WcHmP8h3eR1EyNVaLoL0QrTDZ3r/JXeb+LUrlwny5LGRh1Gu7cUwYxeZAMpZ0QqXIKyEfLl9Su4lqmYtZldn3f3Ia3biS2rieDxyLsGSageNSk5dsAk4EpGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cmbzOhoz; arc=fail smtp.client-ip=40.107.223.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cmbzOhoz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVR+0Tqf4EpwV8Jeu3Zjhnn43npa0/ffTIVm7tpIX8KBzOMWo4NwOkkHhiHaDYYffrSmVteR00Iz8KI59JyqMgk75gk8cuH0Fg1MEuK3CXbCo03b+9jo6DCI+8yJ8yNkHg3P4lob78/pCKJbgaZ4TOqLUG5q0KBDIzg1djXDWzvWdoAHDO4nJ4FQxP/FGqLPejtk6FF0o32iB27ZZh5jW3paM4AS0QwyqSVZP5f9r4J8JN+wFAUpzer2ol2bFAd68/v6ei/7RHcXdAKtlt6eOhdRDhebZh/3HxPKBkP+ppNto0TSVFC2emZCOnT0CdVHLZoR+kOnxEvDRvH7xeKIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yvq01vcRavAr9k3hmIThoZTtntxYyfBZDIEZLVK1Pm0=;
 b=IVxQPO3qsI+m9Dg/0IRJB813ahh047PFl4J3c3WYXxAzj9h59Vp4gEy7A3jE7kCpyHsnpgT3Vx+Qk1+YhLkMN2kIdLsawrEHlpMO3lbbA+wMxatanUAE2AHwcmOxq/h7nwOqHX0jfXzVkg7MPw+o9gxoj0CYiy/vjzGV4Kd8N1CDB4N9YkhKauDx1isCOyk3bSpyYxh45qbQ2DX4VXvvnz7CBzclzrY4RU3TrofrESHiL4E6FGJOMmiSBPN3MnHdMoymZHJH0Qa9NNYdP0iA6PZsgRyu7xdFNG8QmCIefxJOz+ddlaOK9Gn4QW7lVWuVufnyGWu8YwAaXECKg6jrGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yvq01vcRavAr9k3hmIThoZTtntxYyfBZDIEZLVK1Pm0=;
 b=cmbzOhozr4o4EexMkJ0PLgqjXpysHVKNAdar32EaEGagNrCS9Li049KwjscbHK/6SO2Lia7V5fZ2gFnV3jktPAZfLctKuTnfBorXWQZU6JeeTJcOxtImf3ux9flNwHTv64n7tAuQYME3+dWcskUkPL2qJjbtkXxIUCJEDiBtfEy5vh70AF7Vl/aQ9QIFZCRTzeQfFvqyY7zDVyZRagmcrYlk1SIOFElOFsUz18LpXGNdX7CL1+Lb36Oir2zBpC1SkPZyapbFw3pTXwji7yzHaK6QL+nl0sMTQGVzVLAjS24AEup444R81HCbWYfdy9Ep11ToUpz8V3eFvvlaRLQH7Q==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CH2PR12MB4248.namprd12.prod.outlook.com (2603:10b6:610:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Tue, 4 Jun
 2024 04:29:22 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 04:29:22 +0000
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>
Subject: RE: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource objects
 admin commands
Thread-Topic: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource objects
 admin commands
Thread-Index: AQHaq3q0Gsnp+nPJnUOhT0EMa0vfXrG20ImAgABF6bA=
Date: Tue, 4 Jun 2024 04:29:22 +0000
Message-ID:
 <PH0PR12MB5481063D81836C1B063AB41ADCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
 <20240521122937.2004180-8-parav@nvidia.com>
 <SJ0PR18MB44771AD893EA425C0A486692C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB44771AD893EA425C0A486692C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH2PR12MB4248:EE_
x-ms-office365-filtering-correlation-id: d058628c-06b4-45d5-813d-08dc844ee8b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4gTVRo900GZkc5+NhulajSZZfrlgHh3WUAOtcNBjP9OSw/sKD55TJg80wmBb?=
 =?us-ascii?Q?UgFp4RWszQVdEVW0qKsfEJgLhyaKkOD/aUcvYMUrqNlmnFuo/buyKn2CwzWL?=
 =?us-ascii?Q?4agY5ZXe+owZ223L14MX5p+gl+Uy7fmUM6C8yZVhLkb8cQQko2wTeFmiUy2h?=
 =?us-ascii?Q?L8tYFis1McylvSnosUzNlBOj/DEeO1vlFGZ0Zvh71qeE0PggbSiufkrEzUcL?=
 =?us-ascii?Q?8Kpse0ZBS8XI2BynEhGp5gu6iR+5DnyoXt+XAXH8BLqDYQLBR0DvfRTPOvhw?=
 =?us-ascii?Q?wbKZNs8A4yTV24s9AkPgnAajWqqoiWmU3VlnPQnOAvRqVUxQBAXE0MwrTyM3?=
 =?us-ascii?Q?NcKfZWLdOzJKPhcylsNSAoS209DZf19by3rD+3j1hEw2+xvt6c4j0G15KJE0?=
 =?us-ascii?Q?MqLtcsf3Br0dedOnb1Jfv71Hxs+w29wIhHgWCE6Y4B6zP9kOEN0obE/l9JrN?=
 =?us-ascii?Q?Cm43kUkaWPI34B5rI2/Kk5siNaQMKp4+VwppSHnFkeDDMPSVgRNpti24TGhj?=
 =?us-ascii?Q?ku3fPCcqpIK3PL0q4qMk1T3D3wbvrU8U4X914r45bB6mBOmvfzdghAL2NHUs?=
 =?us-ascii?Q?6BUFty1nSYprbsvaeP2jOxC9cTL5bK2HXcZG7Ymf8deyXdpzrX0t2S2L6GMz?=
 =?us-ascii?Q?ZLWYaCkFHNviX7NK3gsBcfzyV96nESM8XiShnqQCt+2ivADyfCIqN84wafvK?=
 =?us-ascii?Q?Uxx1xigilyRbD0ZU3m34rzZx2Wi38FH4Ewrva8HdDrxml7ZhgBhjA5PXWugA?=
 =?us-ascii?Q?Mc+VNzaTvEzkmkM2FM78cdM0E8PvIey5wu0Zd0GWDTi3An+z3r8aYm/Jlqlz?=
 =?us-ascii?Q?x6CvcJNb2Tk+gE3/U5CV1V9HIU+YWfIg383B1OghU1noDzSpGblwxp1TDyx+?=
 =?us-ascii?Q?cpwt9rzV+0mjGKP24OH+M0AtKiwAK1/OCnJqxMX5YwKoQcZ+Cv24dIylBUoo?=
 =?us-ascii?Q?xMAr54LngeqquEQ4Fk2UfeiTAzFVoJpcKV+oG01170n8CJfUSyQac8dS87kc?=
 =?us-ascii?Q?Eie8PPMkZ/z+/qy6YX0GydILRmhQngsxq10cJIPgYexCB2EUh8WACHqqOfB4?=
 =?us-ascii?Q?zUkNjei+sWm/CEVJmuP/S4Vr0mLyjoePKyYcNJZX3p+oSP3vxhSd9CHk1NEC?=
 =?us-ascii?Q?VvuxCBT5bB+nhywOhce9awajff3UDHHeRYeq1B4pvD9VR8bs+/tvOHCzp/G4?=
 =?us-ascii?Q?r/RhOmTx/kJnntBf7kopEzP8YS2eX3xSWpcPM3xB7EM/ISIpjyAvJWVZXRsL?=
 =?us-ascii?Q?sZguFZ4KjZrBLdzoy4d0STNhSplcds3ciEEm/9MP2p1hLp2cwKo8gGGpjXJE?=
 =?us-ascii?Q?ho3aUXB7qSpKeFROAyuYpU0V7zInDGOVCU0PKSsDGF+OGQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kblShzO/4Y8CtFU2w+su8a0fuJgTSMzhRmkaCSZTRZ4wPBq0ncfwx2ryOulI?=
 =?us-ascii?Q?SIrO/Y1zp6iHJ6TY626BSqr6RBXjDOq7dVk9iSBJd1+us7d5xW9+YL5bFdZw?=
 =?us-ascii?Q?eLbeU8D8LOQ4WaOCjHM5wtMmVHsoXfIADXkHIaU3cTOSNUrWyaLF3ttEtCrR?=
 =?us-ascii?Q?O3OGj+jdg+wRA3+Aut9WExTRZ+BEq374KlXA1srA7wPZJUsATe0AqVq7khqx?=
 =?us-ascii?Q?U+Vsxj2/YakXcnUAyDPNYMe3oRThwart+liWpeRYnS444Kh9z5FW0IivD1KU?=
 =?us-ascii?Q?eumQMJ5icFp3IDbrMcZ+HvGT1HkKSh0kJQK9ykZ7+uDlotkmLr0TUtEEY0jJ?=
 =?us-ascii?Q?zZqjzAZAr7sD9LGV9o06DMCwQUIgyz7zkzaL6lMfsaT7NTbKOgq77BnrgP2W?=
 =?us-ascii?Q?10C7o4BmZ+z1PpvjGyMxjDE2K2WqSEyhi4q+ZVRvCAlX7Y+s/0ojdYpOFwgs?=
 =?us-ascii?Q?HhWWJPS7B2GvgG31M3Kh5eq2jXU2AshVb09ZxVE9U2bNNGXP33oTCQ5JQs1/?=
 =?us-ascii?Q?vxNDXGBWBs4KzScOH2d4Hp/sfTxpocMZXO9jIi9NHo9yRg/aeHi/FIVF+bjF?=
 =?us-ascii?Q?WS5dhA7E6gMVVpWpPesyK20xZk/8p6ILopX3pmYPLR1kNjGDDrvMscCVO7dm?=
 =?us-ascii?Q?8t57NVMZPWd81n2RuviV44QcMhzXchE7bbWL+CStFlRd67lDM0TjLyp2Oc+T?=
 =?us-ascii?Q?GNAizL4v85c9TWrQ2zzjxfp9+NFTIvR873AK5iVD9LDoF8Aox5CVfcq0UI+I?=
 =?us-ascii?Q?cokf/uTrPVx6teWWkg+syeRHBerJxumVNpOISG8+Xxy27U8dwj+H46zRdGoz?=
 =?us-ascii?Q?nLe7GQm9ITkeMtDwida16FS6IUI74Qe0/llr/nPxSGroLuc8cSrGg95PmINP?=
 =?us-ascii?Q?CfPtucjKvLogR3/IPk8yr6kSUrRuuAggtbhOuBsdPWdvdecDkeho9nmPJB5P?=
 =?us-ascii?Q?F3q33yU2dnTg8tC218Yrk+OJVh7Tr0aPIJHN5FhIgw/F1NQX5bk3LE0WSDJY?=
 =?us-ascii?Q?BL1lU7IDNf/62iM2TwYh9ZttmqTrsSW6xWw62fxzvgcQBF2Zlq3KJ+gn3/Bj?=
 =?us-ascii?Q?xzypJGTs7yorU+B/p3S8/pe/y3PvSyajbpRV1jQtI6atOkaK0qRbUOqBL+3V?=
 =?us-ascii?Q?7CnrcHsUwJR+1ecRjnr+DZCftUt/2Wel4JY02ociQ9Eu4hBQQn3rUwV/VRuS?=
 =?us-ascii?Q?sIksTLFSGqAnRc+/K/7tVKLukTWnxYRZyaLXE1Cwd+yIraAlIUx92WhC5bgD?=
 =?us-ascii?Q?BqFlNvnJGWnGVzLy4IjQ0CNXMAaA18D/lS2FpIIIW+bpNX2RnTfgqCr/D/64?=
 =?us-ascii?Q?PfDoPFKItRN3hx1iEy32+TFitO8iXn9sR3RBXZKujE0WpGBwqv7s9oEYOZZl?=
 =?us-ascii?Q?PgJeoPGQ9Nbbl0ZE6bmFjcm72gYIzipwxJ119n9ZHKUjQTq/5svQskQDuoV9?=
 =?us-ascii?Q?6FdSMTPlfdyahRq2hfg6oe2dYYxKrzfhKKf+lcLT59ohdu3YnO6L0uuULxLc?=
 =?us-ascii?Q?4ep5haUM1uQJKK5bFIJXWXmI/GEcWbrY9BQ+5az0OsEs0dlcIZ+MUvC/1QCm?=
 =?us-ascii?Q?KYVkRRFvU+yQ5mTqrr4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d058628c-06b4-45d5-813d-08dc844ee8b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 04:29:22.5926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQbqmK6ZZ3R7RUuKLaNmpJBeSaBbcPaI3aLYwqInO4fR/oJqz30Cu70/hxtiwxriByB0Nbwz0BEsWEK4dPdZAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4248



> From: Satananda Burla <sburla@marvell.com>
> Sent: Tuesday, June 4, 2024 5:41 AM
>=20
> Hi Parav
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Tuesday, May 21, 2024 5:30 AM
> > To: virtio-comment@lists.linux.dev; mst@redhat.com;
> cohuck@redhat.com
> > Cc: hengqi@linux.alibaba.com; Satananda Burla <sburla@marvell.com>;
> > shahafs@nvidia.com; si-wei.liu@oracle.com;
> > peter.hilber@opensynergy.com; jasowang@redhat.com;
> > xuanzhuo@linux.alibaba.com; Parav Pandit <parav@nvidia.com>
> > Subject: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource
> > objects admin commands
> >
> .
> .
> > +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}
> > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > +Group
> > administration commands / Device resource objects /
> > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}
> > +
> > +This command creates the specified resource object of \field{type}
> > identified by the
> > +resource id \field{id}. The valid range of \field{id} is defined by
> > +the device in the related device capability. The driver assigns the
> > +unique
> > \field{id}
> > +for the resource for the specified \field{type}.
> > +
> Is the valid range defined by device capability or driver capability?
The device indicates the limit in the capability.
The driver uses the capability to set same limit or smaller limit.

> What if the driver has set the resource object limit capability that is s=
maller
> than the value published by device capability?
>=20
This is fine. It is allowed.
It is captured in the theory of operation section of "device resource objec=
ts".
Snippet here:

"For each device object type, resource object limit is defined by field lim=
it using Device and driver capabilities.
Each resource object has a unique resource object ID - a driver-assigned nu=
mber in the range of 0 to limit
- 1, where the limit is the maximum number set by the driver for this resou=
rce object type."

Combined this with below description from the theory of operation of the "d=
evice and driver capabilities",
Snippet:
"The driver sets each limit number field to a desired value that is smaller=
 than or equal to the
value the device presented".

The device exposes maximum limit in device capability that driver cannot cr=
oss.

> > +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
> \field{opcode}
> > +is
> > set to 0xa.
> > +\field{group_member_id} is set to zero.
> > +The \field{command_specific_data} is in the format \field{struct
> > +virtio_admin_cmd_resource_obj_create_data}.
> > +\field{resource_obj_specific_data} refers to the resource object
> > specific data.
> > +Each resource uses a different \field{resource_obj_specific_data} and
> > is described
> > +separately.
> > +
> > +\field{flags} is reserved for future extension for optional resource
> > object attributes and
> > +is set to 0. Each resource object uses a different value for
> > +\field{flags} and it is described separately.
> > +
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_resource_obj_create_data {
> > +        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
> > +        le64 flags;
> > +        u8 resource_obj_specific_data[]; }; \end{lstlisting}
> > +
> > +When the command completes successfully, the resource object is
> > +created
> > by the
> > +device and the device can immediately begin using it.
> > +This command has no command specific result.
> > +
> > +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY}
> > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > +Group
> > administration commands / Device resource objects /
> > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY}
> > +
> > +This command modifies the attributes of an existing device resource
> > object.
> > +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY,
> \field{opcode}
> > +is
> > set to 0xb.
> > +The \field{command_specific_data} is in the format \field{struct
> > +virtio_admin_cmd_resource_modify_data}.
> > +\field{group_member_id} is set to zero.
> > +\field{id} identifies the resource object of type \field{type} whose
> > attributes
> > +to modify.
> > +This command modifies the attributes supplied in
> > \field{resource_obj_specific_data}.
> > +
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_resource_modify_data {
> > +        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
> > +        le64 flags;
> > +        u8 resource_obj_specific_data[]; }; \end{lstlisting}
> > +
> > +This command has no command specific result.
> > +When the command completes successfully, attributes of the resource
> > object is
> > +set to the values supplied in \field{resource_obj_specific_data}.
> > +
> > +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY}
> > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > +Group
> > administration commands / Device resource objects /
> > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY}
> > +
> > +This command queries attributes of the existing resource object.
> > +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
> \field{opcode}
> > +is
> > set to 0xc.
> > +\field{group_member_id} is set to zero.
> > +The \field{command_specific_data} is in the format \field{struct
> > +virtio_admin_cmd_resource_obj_query_data}.
> > +\field{id} identifies the existing resource object of type
> > +\field{type}
> > whose
> > +attributes to query.
> > +
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_resource_obj_query_data {
> > +        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
> > +        le64 flags;
> > +};
> > +\end{lstlisting}
> > +
> > +\begin{lstlisting}
> > +struct virtio_admin_cmd_resource_obj_query_result {
> > +        u8 resource_obj_specific_result[]; }; \end{lstlisting}
> > +
> > +\field{command_specific_result} is in the format
> > +\field{virtio_admin_cmd_resource_obj_query_result}.
> > +
> > +When the command completes successfully, the attributes of the
> > specified
> > +resource object are are set in \field{resource_obj_specific_data}.
> > +
> > +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY}
> > +\label{par:Basic Facilities of a Virtio Device / Device groups /
> > +Group
> > administration commands / Device resource objects /
> > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY}
> > +
> > +This command destroys the previously created device resource object.
> > +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY,
> \field{opcode}
> > is set to 0xd.
> > +The \field{command_specific_data} is in the format \field{struct
> > +virtio_admin_cmd_resource_obj_cmd_hdr}.
> > +\field{group_member_id} is set to zero.
> > +\field{id} identifies the existing resource object of type
> > \field{type}.
> > +
> > +This command destroys the specified resource object of \field{type}
> > identified
> > +by \field{id}, which is previously created using
> > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE command.
> > +
> > +This command has no command specific result.
> > +When the command completes successfully, the resource object is
> > destroyed from the device.
> > +
> > +\devicenormative{\paragraph}{Device resource objects}{Basic
> > +Facilities
> > of a Virtio Device / Device groups / Group administration commands /
> > Device resource objects}
> > +
> > +The device SHOULD complete the command
> > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> > +with \field{status} set to VIRTIO_ADMIN_STATUS_EEXIST if a resource
> > object already exists
> > +with supplied resource \field{id} for the specified \field{type}.
> > +
> > +The device SHOULD complete the commands
> > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY,
> > +VIRTIO_ADMIN_CMD_RESOURCE_QUERY and
> > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY with \field{status} set to
> > +VIRTIO_ADMIN_STATUS_ENXIO if the specified resource object does not
> > exist.
> > +
> > +The device SHOULD set \field{status} to VIRTIO_ADMIN_STATUS_ENOSPC
> > +for
> > the
> > +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE if the device fail
> to
> > create the
> > +resource object.
> > +
> > +The device SHOULD complete the commands
> > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY or
> > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY commands with
> \field{status}
> > +set
> > to
> > +VIRTIO_ADMIN_STATUS_EBUSY if other resource objects depend on the
> > resource object
> > +being modified or destroyed.
> > +
> > +The device MUST allow recreating the resource object using the
> > +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE which was
> previously
> > +destroyed using the command
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY
> > respectively
> > +without undergoing a device reset.
> > +
> > +The device SHOULD allow creating the resource object using the
> > +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE with any
> resource id as
> > +long as the resource object is not created.
> > +
> > +The device MAY fail the command
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> > even if the
> > +resources within the device have not reached up to the
> > \field{max_limit}
> > +but the device MAY have reached an internal limit.
> > +
> > +When a capability represents a number of resource objects, the device
> > SHOULD
> > +allow creating as many resource objects as represented by the driver
> > capability.
> > +
> > +The device MUST NOT have any side effects on the resource object when
> > the command
> > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY fails.
> > +
> > +The device MUST complete the command
> > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY
> > +with \field{resource_obj_specific_data} which is matching the
> > +\field{resource_obj_specific_data} of last
> > VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> > +or VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY command.
> > +
> > +On device reset, the device MUST destroy all the resource objects
> > +which have been created.
> > +
> > +\drivernormative{\paragraph}{Device resource objects}{Basic
> > +Facilities
> > of a Virtio Device / Device groups / Group administration commands /
> > Device resource objects}
> > +
> > +The driver MUST not create 2 resource objects using the command
> > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE of the same \field{type}
> with
> > +same \field{id} before destroying them.
> Can this be simplified to
> "The driver MUST not create a second resource object of the same type wit=
h
> same id using command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> before destroying the previously created object" ?
> The phrase "before destroying them" seems confusing. It suggests that 2
> such objects could be destroyed though they are not allowed to be created=
.

Yes, looks better.
Will fix in v11.
