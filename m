Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FDC79FE
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 04:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717476632; cv=fail; b=orcPYYLcH26vsKrd31elT7BiU25v958af5CtEAn9TYSuORn2r59j71Db339cREzw/dkTfimJDtrkMdJhadPKrXtM7dZGoJ8G2lxl9vsUU9o8FHzQq0+XZqY5CExdXcZ9Br/BUzE3ob+xQJuuxG4jsyVRuj/MKGIQu6hNKMrNIro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717476632; c=relaxed/simple;
	bh=Tcpfz1NSS+p8nBHZE/A6Zslb3ySuGRv3gEWOmFBdkSI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NuNBXnnr46D+l6I/VrzrIYRTrZRopukjKEzOrnLaPyoKFMcCW+U78NmXmVry9ntvFn97+2CxKTpmnOOTTWs7X00OzxJDGrQkXThAqgSsibeO7VcLjplmMrt1C/gtYULY97S8fUGy3Onuz3L2oFLGgP3aWruR/cYPbqdgELQHsp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CBjhyJ/E; arc=fail smtp.client-ip=40.107.92.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CBjhyJ/E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WERLc978h5vLEmPt8OMZP4LAHTFIvnUulVdgDmx61VNqEwPZv2pXq9ZS6ORf3aJ+8hOI7LhBhlDFhLMInCYyoiVYcN6nh0oBRoQwspWZWcRL0IaoU1xmn+4TXBbKmTXXdh7gqIG4PgKLBUPEQC05N/YMfC+bMj/5DKDFlnQT4D1vkhhYR/ZzMDsyK2HjjhLgxHxYsIOFZwBLiuAUiFfpJGEBE/wvsMmSm9WSfQ4+yCRPvySoKEbALGG6y+oVl9e42uTZhZ7Q5hKDUnYXpZIP2FS07qloEEvErSN4+Uc5vb3Cow+5YOKZWFpG+B6swC2NyPJdx9adfyOmEI2IglUzgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpMqq9hApVSTAGB8SVqIg6pfVnfvpnfVYdzY1FeplQk=;
 b=MWoXIrqrar33VJCVuU/TD7ymQiObBa/Sy1OPL2gOyoKbj9m+ghgDn2vMYLTErVnVcNkRsnqHidwFCUPfrnKfedaYirwMhxpFW42igvL8YaKKJCYefsSM6CPTqjf5Eiwiy47J/hbbTU4EsRCJ7IQz6Sl6/TJR0bMMcLV3bx2by8JqVBdIuwCuaBEI3R+pxAZjoycSz8sRYBMfKo+eQSLX5B21ysG1/nI7kIsdAYH7Y9vHoqtIBNQWTkX9XdtTviKHuEvag1c6P/f0C2bPBNDhUwWNGVmKYcpd+abr+iEM2PyH+biT9divUwHVBOBwm34UIDMlj+tEQjkQLa1/SBiYVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpMqq9hApVSTAGB8SVqIg6pfVnfvpnfVYdzY1FeplQk=;
 b=CBjhyJ/EUmB7pgU8nzCnDD5YDVBadvj38NtctmNQ2ao501sYHuMJxePswKJeUAH3eAyfc73U20KOD+QXNTnkrccQTvUCqKn3CDDKp/D7buYkoiCvnaq+3Xg5rAx5tBggTKUZgx6ZNtr2tpj4gnvorqn0oi3iHhVloO8MRv868yBb5jcZS139h+ooTfPWCgldMpOUDbsHjE41Ey+ECtKqvmUoEQcJmWDXvDa4RWX5W/IXSjqpFWTATFaXjZWULTA3rD7n0WAi8HCBnzSuliW9sOEFw5oHskZoLrlBuxnsn9xA+8TZkroIQF3Md6s4ii9RlwUp0UZCNfaC7Stxw3xtCg==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by IA0PR12MB7530.namprd12.prod.outlook.com (2603:10b6:208:440::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Tue, 4 Jun
 2024 04:50:24 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 04:50:23 +0000
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>
Subject: RE: [EXTERNAL] [PATCH v10 11/13] virtio-net: Add flow filter device
 and driver requirements
Thread-Topic: [EXTERNAL] [PATCH v10 11/13] virtio-net: Add flow filter device
 and driver requirements
Thread-Index: AQHaq3q9IcpWUvDTv0qsXeunl+psKbG20JEAgABM3wA=
Date: Tue, 4 Jun 2024 04:50:23 +0000
Message-ID:
 <PH0PR12MB5481D8FD1CC10D99E6102DACDCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
 <20240521122937.2004180-12-parav@nvidia.com>
 <SJ0PR18MB4477D6A644C2C0A7F7E14DF0C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB4477D6A644C2C0A7F7E14DF0C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB7530:EE_
x-ms-office365-filtering-correlation-id: 453eba5f-5329-4fa8-133d-08dc8451d86b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?fsgeKWkt1Fd8mOwU9CBmKfcLTcM3cx7CegBX92wf3iaJgXDtgcHDPnTzrfmJ?=
 =?us-ascii?Q?WD6OWoqpKuOebY/XJVPNFCPs+Tsg37TspRkMEu16grd7MZy9y5Shj3VsOVCg?=
 =?us-ascii?Q?vcZ71mmas8sFlPOxcr3TEJgdrZ8R0i1hH7ksFH4ogyAZDsOmSFEmQVINfv73?=
 =?us-ascii?Q?BjwLSBXUv53DAeZiIcRCAaZdUwpiMMr7Dzt8M05QMfDO7wukF4rbROuh1J3J?=
 =?us-ascii?Q?wf+XI4m+gFwi79ui+tXGKNvvKTi6p6AOkc/LsARVoqtC3b69mXwOiGdN3kui?=
 =?us-ascii?Q?YknWwbAhccgnXe3Z3A56kZCw6F7cxEp5ukv1wXAWWqSgEMmqzAMK6a44mnoz?=
 =?us-ascii?Q?Doapg4SuoVhPQBmfkOqxHy43Ut86B9Img1x8H+lNJzXXOllKzZBGBXy8ixYI?=
 =?us-ascii?Q?lXLMAjixJMUAOCCHZJdw4oWVUWpG4NIq+ChkuNt7NHWflH0Xo7OTt0XQwoCO?=
 =?us-ascii?Q?4a9Q7piwgUtHjqZTZlFdu2VMgH2KNlZRuUOZoOav9IJiodPvC5sDQIyXIiEO?=
 =?us-ascii?Q?kfrfMUlnomJni4lXGX/cDgJDey94j5hxs7RcfZ9ZpmOQYZFdCe0ryAmIa3Qv?=
 =?us-ascii?Q?rPqQP9UHizS/ktFi4zi76Hr36OA/b9fWbpbh+zlM04ElhBy8EaiZ1Ytq8hti?=
 =?us-ascii?Q?wJyWyIU74bxTl9Kx7tWKVALVejZ3d7PLU9KFLe4N+/U7jjXV0NKiDPpqTMuL?=
 =?us-ascii?Q?YIdLA3PzAy0AvSbPoCh5f+eqj31lT2CCjLy1vTrjaPKrh+0Jjd5bGcZOqDxm?=
 =?us-ascii?Q?5D7eQ2OcJBDEM4bKIbUo8iSx+1coPvlyQb7BIAhjK2UE6GK3KwnFrAq6tQ/r?=
 =?us-ascii?Q?0Pj7ols3pBAf0x7IMttYKve9Pzruc+y0iQMf2iGXJ9hH8yXJBMTOiMPWsEi7?=
 =?us-ascii?Q?4eb0T7NDinMNRD5s4dWTjFXnKeA4V8xFlpuvg6gmquv70UXa2jnTTmYho+dk?=
 =?us-ascii?Q?F/qsz/IVgtr2CX//BOG4mJPKJwgV7NscbQoaKfRXAQjDBfxZRXtLTkMzceyB?=
 =?us-ascii?Q?YoWwWAWcqXEJMuqiI508HjtJ61+jCIlZLjryFAi0gQKJpTYGde2o0UqUBRDD?=
 =?us-ascii?Q?GlOI73clt8LIiI1RhXGaTWYLYUX2Kkw7zXkPTH33QgU1c+cMXBvqjgmEeryW?=
 =?us-ascii?Q?2bdqm6KcugZDNCuuGNrJp7YFO+/8fJa5VLPIwKsajlPTf4giBklutMC8xLHL?=
 =?us-ascii?Q?oXs05kcoFP1vaVnlhdSNzpBhRgYD/3khXYfUQQZSAVYofsfwD2jJV4ODonmA?=
 =?us-ascii?Q?Z2+0jDKnU/Xl0r/cg52PqWjfS3iJE3Qrs8ui5/fMLpD1dZF7Pj1mhuCnHMmc?=
 =?us-ascii?Q?PmIXNGFt0MtRdMxqIsog9IGt5iBLx+9bXzoFyCtfkx0uqA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AxXmiHTTi1c1q/uJzDe8R7w8ZYKm4O1RoA1WRSJiwX8Iml4oH5ICWhXgq11M?=
 =?us-ascii?Q?vNEZ7RRTUTkg01PHTNTskloOscvggoseMmg6csITrnV0O2T3cFGaH6MKiEPW?=
 =?us-ascii?Q?NtLFGzpaO469fwTNwXLpNULdjCnrCc3lZeCj5LxFLehjKQcwn9ZI0KV4NapQ?=
 =?us-ascii?Q?UIw/AKAUqBH5EQoLqrsfkEjTsckjxhXfYooKfu0I3hP42hKMfV4ef8TDsao2?=
 =?us-ascii?Q?gFeIq4NvlsV6PrlPNYSxU/QeGmhpE3xGaM/z4LUj1zxxrVnyVwbbXCJRiFPy?=
 =?us-ascii?Q?Cwun8JvRymGVX/E87Fl6foYQ9YM70ZyB4SWDSabROcJPDdBojUTDkSR20slK?=
 =?us-ascii?Q?T6Pw+8z89QN/3T6SKmiCud8qLhy1JK5goq/Wq6/AXAHmbj3ZfFQ7QroViqeL?=
 =?us-ascii?Q?NVrifH5V45ox9uWT/CFrv5NwyTdrpPDMJdghx90fmeBGXcwzVddpGLa8VEYF?=
 =?us-ascii?Q?m+dtymY0TOjg68Bhj1nkU+g/feI0CH9W9If0DXKveE0vDmWnMsf5Z9jJMPWn?=
 =?us-ascii?Q?DiEgIB0ILo1/xAo1cW8Z9y4xgXesJnbJmd1vG48G/GGVOYQujRlphYhxd9sE?=
 =?us-ascii?Q?d4YG0/4ZA0CL9MM1DBOf1LK3KbVbVN1i4d+L3Qv9M7+2qngJIHwvgUNFVhXl?=
 =?us-ascii?Q?ReiugBmJ4sTZ7W5kdouhrteq3dK96wdEgI8UsSXQdlj1bpjIAUM7iaH4JfZX?=
 =?us-ascii?Q?DUgKQYvLiZz8X56hkF9rK9ljrWFimUrD/fqNtaAwf2MGgOWC9DZXJF9W5n16?=
 =?us-ascii?Q?Hfaw8XAJtS/t0lOXsk8/0UHNKnsbYrE+braR1y8o5iMXc/tMN06KmZT6EfiY?=
 =?us-ascii?Q?Ci5AQzhBjZwaAk5Yz+riEkeMDCm7FtobJsYSXlPnSx9JFY3/OhHvG7PEDd++?=
 =?us-ascii?Q?52c4tJ/5gb4v9EUghvsVIinIDZ69YlrT6NjkKJmcnXfB/Pgtjiz0qaqG8qfE?=
 =?us-ascii?Q?iVFRQY/+ST38r3rxGZiJYxdIhin4Qr3X/QDGFxc6AlLYIXJ/tASf5q/eKDkO?=
 =?us-ascii?Q?pj6FsXCjTn3znHJBpaF+8SAxmd2n29PFbtZ535+SWSqM1QT0gFC2sujbcHr8?=
 =?us-ascii?Q?j1yPEKI+v47DmfkX9w6M+VnuK2lck1sEUbpWVZ5Ap5fTVhwtM3k20JhJGY0Z?=
 =?us-ascii?Q?AqOu6GUyvTQ3ICm3+B5znnhHKmOF5kXQpEAZozQ1GQixYUZIt+Q8M8rgXBXC?=
 =?us-ascii?Q?fSYoQlWGBkzEAS7Nu7aQhl9s0UKG3soJKBxppe2ZPdi4zE5JDb5IghXDR66t?=
 =?us-ascii?Q?cqQL8WpPlglVtT6iF+MtdGVF0VhrfA+UhDA+7TyrxtWd4sge+mqvDWaG+B8z?=
 =?us-ascii?Q?epSc5M4MAuyNTE0S8AYo/H561FB6aJvYFKoqd7uKAd6yIdUBRyHbrVqc8zPo?=
 =?us-ascii?Q?dHYFEGn5sRnanYNgPlKfJJTk1MPt83H3dGYYkXcfHIJPxHgGBTrj6R4bhazn?=
 =?us-ascii?Q?XonN3pc33JGSlJARtDKl9eySaZ3SgBwTprrn3agG/OMYJ2CIy+aTYZf7vero?=
 =?us-ascii?Q?Edv25m6YFiina4VzB8bPVY5PIr/ZI+rTNj8N5i+OKqpTffV3riXkCvwZYniD?=
 =?us-ascii?Q?c5dzZhjEFNAj6Z9vAA4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 453eba5f-5329-4fa8-133d-08dc8451d86b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 04:50:23.7835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rxjS0KP9j+4ShqoAFGSWqZtFOJc9IuRxn/9YaT23lkdsDH0Q0+papPCRCrSe6Jf5Vw9tUZiLchuNUNBBCWDuHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7530


> From: Satananda Burla <sburla@marvell.com>
> Sent: Tuesday, June 4, 2024 5:42 AM
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
> > Subject: [EXTERNAL] [PATCH v10 11/13] virtio-net: Add flow filter
> > device and driver requirements
> >
> .
> .
> .
> > +The driver MUST enable VIRTIO_NET_FF_RESOURCE_CAP,
> > VIRTIO_NET_FF_SELECTOR_CAP,
> > +and VIRTIO_NET_FF_ACTION_CAP capabilities to use flow filter.
> Does enabling here mean  reading device capabilities and setting driver
> capabilities ? Or is there something else to be done ?
> > +
> > +The driver SHOULD NOT remove a flow filter group using the command
> > +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY when one or more flow
> filter
> > rules
> > +depend on that group. The driver SHOULD only destroy the group after
> > +all the associated rules have been destroyed.
> > +
> > +The driver SHOULD NOT remove a flow filter classifier using the
> > +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY when one or
> more flow
> > +filter
> > rules
> > +depend on the classifier. The driver SHOULD only destroy the
> > +classifier after all the associated rules have been destroyed.
> > +
> > +The driver SHOULD NOT add multiple flow filter rules with the same
> > +\field{rule_priority} within a flow filter group, as these rules MAY
> > match
> > +the same packet. The driver SHOULD assign different
> > \field{rule_priority}
> > +values to different flow filter rules if multiple rules may match a
> > single
> > +packet.
> Is the following needed ?
> The driver SHOULD NOT add a flow filter rule whose action refers to non-
> existent receive queue or a receive queue in reset.
> Similarly should driver delete all the flow filter rules whose action ref=
ers to a
> given receive queue before resetting the queue ?
>
We have the device normative as below.
" When the flow filter directs a packet to the virtqueue identified by vq_i=
ndex and if the receive virtqueue is
reset, the device MUST drop such packets."

In other words, the driver may have rules directed to the VQ that is underg=
oing reset, and packets may drop.
This avoids any cross synchronization in driver between queue management an=
d flow steering subsystems.
For example, for Linux, queue management open/close channels occur under rt=
nl lock while, flow arfs rules handled in a non blocking bottom-half contex=
t.

