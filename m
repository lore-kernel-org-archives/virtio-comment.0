Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75572CA5
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 00:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717459904; cv=fail; b=hLEgBJWT+4YDIGkoxA3zGzWpZVEA687utfqm6Y6au/aBpN9mw9QYP/doyXeQv9Pb9pWmCvVWw9KR9bE/f5DnWq+XomNt5kHZZBx6l9+4kKsdpYTYZa7bf2FwZYgH7PdqpypmSBcMCHBwAFamBkShfrG5uLJ2VrB/ojpNQ3McGnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717459904; c=relaxed/simple;
	bh=juknGfV/+pN6NMT7rzxBfpYpL+Xd8Yw2v8h4mqYiAII=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ijJ7HTbFYySu8/tGgP1Np5keuV3pl6aiczHBziU53vQcGl6ecuudS0UTlZrvsbNAl3sUlAzZf/EE7EtxFHZ2GdUFEryHkfmOvCWg46tO76CESk+riNbWUhOAmbOZ3ifH/S7FdWWhv1vlCdMWlfcy58ctAbgzDkv0VlBpovE5k4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=jv/Y+A2i; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="jv/Y+A2i"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453IvHNP006512;
	Mon, 3 Jun 2024 17:11:39 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3yhb3wav58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 17:11:39 -0700 (PDT)
Received: from m0045849.ppops.net (m0045849.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4540BcMR014139;
	Mon, 3 Jun 2024 17:11:38 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3yhb3wav54-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 17:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnjJz+LC/zh9g0CD6vnEb/LjoBkikqy7WgNkRwGFbBYesxtorXmldWPcui6DAnYpW42z9+cOdvaz29IdWZDbKM5UuUHJGPAcoT1toxDXFbh1xR39Ox7RASmdbqM7Y7i79ppEAiwRCU/5ltHDa9nxOZ8vA1IYKfbTALRKNFk1NDDCqkhSHO9HhB2UmBHm854TqX6DDZ2fdIHvFbFeoEf4trAJiW/dB5wKDs2kHvB4lp5llMRculDXinmBsvVdkHg8rk2uBFpg6IXAquWFETOgk1TeM0TfjFigAYeIALy5f38n7SMEMXBV2RdWPpTLb4Y9772xPF97aMPvGhFEw7ms6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+6RCVBbr228TgTbJ/wGyG8jj6JmyXPdH1Bc40g7k9Y=;
 b=dtXYxzy8LVWqXkML3KVpoh14OK4gc6i+QR2yiJPPqWjGW5cHFkztAlG1M4/77hM/nEeesgWdwql/HWO1eo1CPJusCI0nmQ6ncTkxkUI6aUw80e9S5b6Dr/pnj/54oPVZqomUVQZjhm5exb1hOBIbZjgF9r0MDPa+To/nLjRpBTSgVAHeS7luZ8XKm0biB601cnl2gCEWV7+xFSarv0ZWsr3+UKAX3Peli6Ue9k8wy/M9mFhj8IZ8lnwSeGgRTOU94IqfHOv9O0UDx99xMQ0jnQYt4oR5n77E3i/XgfFxYYYVdIQ1IPtV73QszFEi1okO94VsGR7hjA3PoOxtZoVwOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+6RCVBbr228TgTbJ/wGyG8jj6JmyXPdH1Bc40g7k9Y=;
 b=jv/Y+A2ikrkXm9UOMeLEg/PKYZxI1bco3cf+CF4cf50IHE6YNcL/49WLsjS2spMnHXE3JQuQuWNOsGv14+Zg5qkundSMSMIOsljmnm3j7gZzz4XY27zDrCj3wW6dop0dR7Ee5t4fS6gsFLY2DZ8WFvhH63n2mLgRS9vCp7g04Hw=
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com (2603:10b6:a03:304::23)
 by PH8PR18MB5309.namprd18.prod.outlook.com (2603:10b6:510:238::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Tue, 4 Jun
 2024 00:11:36 +0000
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b]) by SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 00:11:36 +0000
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>,
        "mst@redhat.com" <mst@redhat.com>,
        "cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
        "shahafs@nvidia.com" <shahafs@nvidia.com>,
        "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>,
        "peter.hilber@opensynergy.com"
	<peter.hilber@opensynergy.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
Subject: RE: [EXTERNAL] [PATCH v10 11/13] virtio-net: Add flow filter device
 and driver requirements
Thread-Topic: [EXTERNAL] [PATCH v10 11/13] virtio-net: Add flow filter device
 and driver requirements
Thread-Index: AQHaq3q/OndytfEWhEyscJyYOyv1J7G2y52Q
Date: Tue, 4 Jun 2024 00:11:36 +0000
Message-ID: 
 <SJ0PR18MB4477D6A644C2C0A7F7E14DF0C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
 <20240521122937.2004180-12-parav@nvidia.com>
In-Reply-To: <20240521122937.2004180-12-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|PH8PR18MB5309:EE_
x-ms-office365-filtering-correlation-id: df298846-16ce-486a-f11d-08dc842ae63a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|376005|366007|7416005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?5pbKDhpXe5zW7fjvDVB82Ti9OSVwlxhzgPJc5XU9CaiVLhYpMlm7jbcPI2Jo?=
 =?us-ascii?Q?wMyqHXReeJMF5rbnpNcPt+q/cqB4S8fu7S5gkh8rTsB3+PTyWp5GzasdIQpm?=
 =?us-ascii?Q?G7XtNRnJaYOX0AbEcxOYrg2Q9XyLADvOYtGSUq817QCVFbSdGIto0IC4VXw1?=
 =?us-ascii?Q?tmwpj/qqkmmaDHPExVywW1jg/QaARhv6TTFt5Q4N7VOF8YcvHVKW8Khp4vMD?=
 =?us-ascii?Q?QdBeHGRzWtdjzyRI7eZt/IpSPOC6kT3AHcSNjw2n8SQWcCYTElKi/YgzSVS0?=
 =?us-ascii?Q?NsHCmtgurK1dTFOrS3dea81ufVYyorGu+TcAHaBUgeQDdTDb9+gKhsFZWU8S?=
 =?us-ascii?Q?5FQ0FVcYpPW27HfPcamBDyvxEhMXQyqhI8pn2wr6ViMtcEODuJtTx0rqdve0?=
 =?us-ascii?Q?58x1bzr32Di24aHtaanDMMFEnrZnTRhvogtOq2UavdZ0BkKwq/B6LTcEbaVw?=
 =?us-ascii?Q?u5GUzEsl2eOqoSslm8Oi9XaoR7x3wCZRZKJ+Q6X9T4uM6YKHoQyV+LmQO93f?=
 =?us-ascii?Q?AT7DYev1/ObXFvuUYeyuLiiGDURglsVsbAVxP14hwBrZP8Gp0HK9sj9dl7VB?=
 =?us-ascii?Q?bYaqkBpGbzbHmru31XB9Xl8m9HJk0/fUt5ZX+pEE96hXB0y54H2cqle7DdiN?=
 =?us-ascii?Q?0sPI17L8vINyKyg00vt4zO6XFzk98ErktqLMKGhU3AewUtQO3u7Z3EroPZKe?=
 =?us-ascii?Q?Rg/QX9F/lWCMjNpDZLNugJ+cL9lYI/P10ncIwLYLoGkndCyhXghQfQy1iRJe?=
 =?us-ascii?Q?W9+WmgTDwjZ7ZftWePkZPs6fDjxgLfzUgCIUogOMkbsxWUzumeDq8ug5n6v/?=
 =?us-ascii?Q?gZRkO+c7/b2WPqq3DvrRBPHyfHHbtAVw0GWuuofvJoKU9Z7YWh0xAaEdxSgx?=
 =?us-ascii?Q?qYd/lj24JQnT8oDLlIUm9jDadNgUnbvWoU63fEXvF4ow0Cbx0R8wYOo6P22+?=
 =?us-ascii?Q?mPV0ZNxdmWm04QNO198uuua3UvQWaonAfcBOFWLMGOknjm5i35hnR7s90OEA?=
 =?us-ascii?Q?f9lkPxqlmEqe7O775OrVCggUXOhCcuQEhQoOPy8ufLUfZqKIGQ0d8YGSZccE?=
 =?us-ascii?Q?yeaPjawmwX4pAQ6VcpzbVclIY0lCYR4GaPY6tfyduYDAqmQlKuMpuoc01IXp?=
 =?us-ascii?Q?xCZx9Hf93of7D5gTQ65j/LnW4yvkKp3FnfDoHM3v+wZOUpCDqaYcyq7B4++q?=
 =?us-ascii?Q?uegriKGw3erCWe/xT7qGbNb7aP83zvkypMQndpw73TvDTpkponLTKgHlpBI0?=
 =?us-ascii?Q?EQv2ENpOucO3gidWUQ4h8fOPIqY5jEOns8fGEwYiLVP7qZM1d0KKAr+6dEnk?=
 =?us-ascii?Q?lA62mFlw9ItyWakDFqJnuKI1o1rD4UL98GuJ0qcjfNgF2g=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?VfhYliyRNhEy9TZPpSo9/tpA6ZPVjD2VTdywYjnQGr287uTJeE0jSAVPI92p?=
 =?us-ascii?Q?FMgFJ5+ITDvF7GsDY9efZ0TJP9RUT7G8Efr4+Nz3ocF5QV2XLUZ+Ffg/UsfI?=
 =?us-ascii?Q?EJoSVNCXz7k7mUdwQP1HNqV6mXRi7apFGdGAI3GyWVoyXA2rinafvZHSHxA1?=
 =?us-ascii?Q?7Sie6ouFxA9CqbIy8zSaciJxK8LA4x0A/n2uvhSOH3dG/XyoAL7P2PaUuRGs?=
 =?us-ascii?Q?opc1S+HIyvHx3hHCzBzMQLh3p8sRUZ6zsaaBJYxjlGmPVf3Rmv6lWcL1AfrU?=
 =?us-ascii?Q?VfslK8mcwpYZqLuG44gFQqM6Ap+u5n1vOucakKQFxubVWJH4ack1m6WrS/Z/?=
 =?us-ascii?Q?dsSSo/5YBYBXOV4JzryN/aAz3/0HNv07ghCeAQzyMvhfiGt0sDYn7XGyypr/?=
 =?us-ascii?Q?zliLDUDxJfWhTBTff4ku6+zAMwLoqXsbkFxl9EJHmJ/z3nf0DWqLChY9Jqv1?=
 =?us-ascii?Q?0Veij+SdMN/Iiq5FMzGZMjpwpa2qqHfqe9l7sVgE5gYUrER6t03XqzZ20PxB?=
 =?us-ascii?Q?LVEc76/bs9wpcfBhgkaPlaljegoq5DkTvFsxElXNp2E/+2VjSMdRrpU7yoGH?=
 =?us-ascii?Q?/gvnLBEmp1HNc6BfNBnH1hv52KNjqSQzLsZNtwLA27c+aiKg6sgk2af+ZBud?=
 =?us-ascii?Q?2GEWxuReqX8+nLGJKQtim17B4T2CKNNgCDIZP6eRcz5kv12sMBTxD3p+folk?=
 =?us-ascii?Q?roQH4OHo/Wi0Y4xvB50bbybLT6b7xhbe8sFqCgjG35aFqGNsRlXnYra2RAfD?=
 =?us-ascii?Q?fAJO057uvWJ1JFj3w/VgzKs3DVLQ4/FhMpfklJS0nR/so1TK2LPphnxDH3L0?=
 =?us-ascii?Q?Kshb+YpsxkIzYaWSEebK3uWb+QvEkc8QwUnSRRAA9pmclVjmOkl/w6K+/zV7?=
 =?us-ascii?Q?MDhAXaW17KnbZDFf5DNz818OYKZtcoaySZXRZu1wre5k2kHoYO9pEfiBUgbA?=
 =?us-ascii?Q?8+E9F21MLnIy8H0Xt1+4efCkGFhIzuZjoquiF6xPmqoyjj/upqHQvi6Dy1qE?=
 =?us-ascii?Q?RtCDVBDwXXFIaoemHdqSRMH+ExotpJIBrfTR7Tc5aAZfJLywp5xujHv9Bl6E?=
 =?us-ascii?Q?M9n/11Vs7RsuDmPrWrt82b+lbiwYnQHFS5kiL0Jgbnlm7XZpZFkh+QXooDvK?=
 =?us-ascii?Q?332Go3LvezrLYZiNyDyEEyIMIzd6MZcorG4T6KCPME2oAOZdO4MyOVZUU+zo?=
 =?us-ascii?Q?kQbPMGjmNVkHzwp3cG8dpg2fKhcBh9mphbXTzsUx3XiTQcEo9Bz5ZEEgJsAz?=
 =?us-ascii?Q?BYSX1UfPW+zyGUzrLe9BFzXLM1JOxpN8zxstJO/7dwMUnHdZdP8pNwFCzLwP?=
 =?us-ascii?Q?2r7h5sU/Qh2YpRrPa/3Jp4d1JjlRe7vP0vhc9+oZ2OuSDZ4kPe6kLHb7/EjX?=
 =?us-ascii?Q?qjdo2psP9heinCNAS4ldYsalCk37+Xk6YSI/xE5BB253KZp31ZBX5kzOVRnF?=
 =?us-ascii?Q?3pVLhESQgB4h0PP6tKi1k9SLx0yH0k2sWxZiWpA3C9/roWdRd5BGqlIP/HX9?=
 =?us-ascii?Q?65wC21s4/pKRJJmdalYrLahnERoqV7HYgIKNCj3s4a9dwaHrwg5ihPTra0fx?=
 =?us-ascii?Q?Iokl1PqC6SojVksbrWxKItGOefWWekQfASs+lTsz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df298846-16ce-486a-f11d-08dc842ae63a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 00:11:36.2423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+EnnA1PbeyG9ruRMdupFg0etuUVgi5sLMNFs6I+eRwhybGtHf3j4b381DlxD/4ZzCyg7wFPxzawewUlvAaVtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR18MB5309
X-Proofpoint-ORIG-GUID: FZ6bR5LfxTvbK-xjMZV833dvTxQoCZkB
X-Proofpoint-GUID: z6d7HkSB4t5v3HZK4Jp1SDOdm8i5Yh4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01

Hi Parav
> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Tuesday, May 21, 2024 5:30 AM
> To: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> Cc: hengqi@linux.alibaba.com; Satananda Burla <sburla@marvell.com>;
> shahafs@nvidia.com; si-wei.liu@oracle.com; peter.hilber@opensynergy.com;
> jasowang@redhat.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> <parav@nvidia.com>
> Subject: [EXTERNAL] [PATCH v10 11/13] virtio-net: Add flow filter device
> and driver requirements
>=20
.
.
.
> +The driver MUST enable VIRTIO_NET_FF_RESOURCE_CAP,
> VIRTIO_NET_FF_SELECTOR_CAP,
> +and VIRTIO_NET_FF_ACTION_CAP capabilities to use flow filter.
Does enabling here mean  reading device capabilities and setting driver=20
capabilities ? Or is there something else to be done ?
> +
> +The driver SHOULD NOT remove a flow filter group using the command
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY when one or more flow filter
> rules
> +depend on that group. The driver SHOULD only destroy the group after
> +all the associated rules have been destroyed.
> +
> +The driver SHOULD NOT remove a flow filter classifier using the command
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY when one or more flow filter
> rules
> +depend on the classifier. The driver SHOULD only destroy the classifier
> +after all the associated rules have been destroyed.
> +
> +The driver SHOULD NOT add multiple flow filter rules with the same
> +\field{rule_priority} within a flow filter group, as these rules MAY
> match
> +the same packet. The driver SHOULD assign different
> \field{rule_priority}
> +values to different flow filter rules if multiple rules may match a
> single
> +packet.
Is the following needed ?
The driver SHOULD NOT add a flow filter rule whose action refers to non-exi=
stent
receive queue or a receive queue in reset.
Similarly should driver delete all the flow filter rules whose action refer=
s to a
given receive queue before resetting the queue ?

Regards
Satananda

