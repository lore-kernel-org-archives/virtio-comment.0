Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8352C80
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 00:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717459900; cv=fail; b=RKZGOIV2TmD0NGjZAbb15lZ4KgBVJZl2ElmOYmbk1+dcS4hNug9X+yG5nVubx5I1Ga7OnU6vLDT+0gtQKpQ5w1S5rp2dqwm8fSzQqVXz66VxHYayz5yhbDNbXzlrGaG/f9R4MkUoYUOs4aPIuJUsDKuaHm0TOBRm9Vm+KHp3boo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717459900; c=relaxed/simple;
	bh=91frARUy70rgLo9K3fMEk4ozqiM+VfKRxXFMEKg6JjU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SVT8tRDdPAp3mCq+dtgYMs6e1ZnBQsRmA+Kmtz9/FGqIo+Ndvx/12ofcdyyOFJuxQn9s6NzXTM7y0XSknwT5fKoqyTAucGz4SSXROUrVFjvzriJaTbgw1ASsLdTX1IHiCzR0efaFvcsrfwyk97zOPxeV+rx6el3D0uLyurs7H7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=HsBGsUtx; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="HsBGsUtx"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453IpHGM006650;
	Mon, 3 Jun 2024 17:11:35 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3yhb3wav52-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 17:11:34 -0700 (PDT)
Received: from m0045849.ppops.net (m0045849.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45409OlN009929;
	Mon, 3 Jun 2024 17:11:34 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3yhb3wav4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 17:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bMUZqDhQ9W7sPerPOvYi9iOPt++XmrjAERF/mT8tf4D1FF4/ao4pk/JCSKWE36dSYXQjv2mMfex4Ym9NJLWszD+sQnDRtocfmxtHqa15VskkFGfX/Sw1Kah2WjwBH7nfXplsqgUnYmYj00C82kKnhCp7d+vdSZ+Ewl+0z3+sAa9VKeg8ScZIDgi/v9XYF9U6OIP0575EC22cP4XhkMYPf2d1YxIDWtvk9JDJD6woyk3ehvTKuR6SiYv3nIaAPxzjEmvYf4JiE+3BMW2BvwPx3mPQp1Qh/Rol+tC7FYm9rhIldKFFgMyX9pb40ULsnFXmATdXYSxIOEQPH4Vjzn9hUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yY2L1BgYAkH/5AM2+gulWAjPjihWbduimxOluHhgWj0=;
 b=UCjJxUIZ0pDAfGy6HKnwD/4cPRi2KSRNt7X91Po/zc1/St3V2VYik69O3IwvkzoI3GROHDwabP1gLaQF399cuKQOnxS19DC0F/DHGg5eN4bM16d7yK9ricfRH3Z2Tn5gbMf7WT2mSeoJv3ixpozMredyMbEiV2v1fHyUc/YvP/HBu3SuezESYd62wmGvhXrBn50ZED73NXeHpXVT5zQ9JG93WsjSEzaBHhd/K7Wz/NE3ShCR7mOFcDLqOU09/lWkh9/AFr/7xgaaILHH4V8Ad7FPhsWGp2W1VxWprRCFm9eft7vZJeATarg0eKUTn55UFvWugGxmT25Meptze+bYbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yY2L1BgYAkH/5AM2+gulWAjPjihWbduimxOluHhgWj0=;
 b=HsBGsUtxYrQFAsXsBXmsXV5xPgYDGgokOEinTyEVzUWHJ4xgPhKq4OA1ZKD3Gh9Em7flBCfohoAd+AzX8dftEZxPr9PXAiuoHYikc20H7iYVjYBi70hsBaImZWpR+Iua+l+YeOdUQBC0x2LKElOhj7vadqxLla6+HM5owJ69pCM=
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com (2603:10b6:a03:304::23)
 by PH8PR18MB5309.namprd18.prod.outlook.com (2603:10b6:510:238::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Tue, 4 Jun
 2024 00:11:31 +0000
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b]) by SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 00:11:29 +0000
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
Subject: RE: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource objects
 admin commands
Thread-Topic: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource objects
 admin commands
Thread-Index: AQHaq3q2FshspUNOLkCO6ZOTmkCqHbG2wvvg
Date: Tue, 4 Jun 2024 00:11:29 +0000
Message-ID: 
 <SJ0PR18MB44771AD893EA425C0A486692C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
 <20240521122937.2004180-8-parav@nvidia.com>
In-Reply-To: <20240521122937.2004180-8-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|PH8PR18MB5309:EE_
x-ms-office365-filtering-correlation-id: 22cc7418-eee5-498c-5103-08dc842ae215
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|376005|366007|7416005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?uj5AKctvoKlT4JHkgq8Gyzr1Wrj5okNQ84MJFgm8/Up7iQQlJ7J6sgwyFT1D?=
 =?us-ascii?Q?1ESJ0DSfZyIOSfYzS2p85S3HUYaeAq3bUeEiff2s3JGhgrNv/OBnSBp9H/ih?=
 =?us-ascii?Q?CQ4eorIwGBKK7Vo9XtYYRQy2uq4QRSYE0xRhu2EgfgAo18jTDr2QmozUIGmb?=
 =?us-ascii?Q?kfCAY+biADNn1bhnmUzqMuWRBguqJN/DPTFDbUGWoDmbF7viX67XVD3eLhZu?=
 =?us-ascii?Q?iXO/qo/kEOx2N47TMJzP0rI7tDKkFrxstBOROtnqlZLnWXkMinw8R+p03bql?=
 =?us-ascii?Q?kfb1+9PDNWYb0QQj6RPGz5/RnheYK5HVk/6QLk+ahTAtYol7P3Yw9qX7vLfT?=
 =?us-ascii?Q?utz5Jsvg7m02fhl5QbU7bK4lXIvJAgAQyWw6tGCn0Izy7aYtONxbPo0DXAwL?=
 =?us-ascii?Q?VglNt0uyTnduF74aFw3dpG4MUskdoiUWsSevdtZJG45hjvJ4uZqp+ey5tpNb?=
 =?us-ascii?Q?3HVIQHXa2g5+QNnlHEuzRbygGKLPPJEEzQEGcGK1JisX6735C3Z15YIZswbM?=
 =?us-ascii?Q?7qzLKJ8A1supc1uBQX05S7qKoAXib66mlzOZEOGLf0jMmfyBXIobRJ+9zIUL?=
 =?us-ascii?Q?xMEQJJLG9yKnkq2LlK7kzL95yCTzmhN/ZapkXVdncjH8EYu1/CTZzRHuYwWV?=
 =?us-ascii?Q?BXiylFWVPV4ElNYNeKpnLebCamU1TceMGubpBcaqS+nGNb21pt+x7+aNzXAm?=
 =?us-ascii?Q?gST2aeSyvrU/1J4p81B56VTP/UODj2oVprSGwI/dEIBG0va05biMC/MxZZAc?=
 =?us-ascii?Q?qrFVcRExDmlv+3EjfWSkosM/XAkjCSTGE+p/kuk8kt5s52jcOt0dzOZ2wPyp?=
 =?us-ascii?Q?YF61qL/oh2mgFdb3cS81zl/RmvfTdbpeuP+nltGVFE0rNgZ2pJT+rWQKtJHK?=
 =?us-ascii?Q?GR12/jFe3ld79RvH25kjq6N3uVRNlj2pxuXBrIRw8JSOaQ1nPBqNpqWn8Ea3?=
 =?us-ascii?Q?OCTit1wSodkNn6JUBXj9b/YrKpeCQVazYryRAe2sZGiTIwAvD2GERA17joPh?=
 =?us-ascii?Q?qPLxugzKEcHJ/XE8J5wUagfVBQ/E4HIiUR32L80HaDEBEhW+A5NGC66/Ir8T?=
 =?us-ascii?Q?OolW+6ZTnXmF1zP/gqcFVJhXH2+hchUYrtDBllgUIAoc4hjnxvpYMtmhAnGJ?=
 =?us-ascii?Q?eXSc7ff8n4t7OtPrGKOiDfCNAJ1Rolya3geR/8T9nantg9m+bkCSUtrCbqHQ?=
 =?us-ascii?Q?0ZV3W18FSOZI4pvrcQwoOQEgwT6NtN0wVDdD2xlW+8MdnzoZ4JLL6Pee55ZK?=
 =?us-ascii?Q?VRo3XILWLj9DvLThuapqN7s2NQfiU+rHW2C59CvcMwZ33237rIzatwZl9udN?=
 =?us-ascii?Q?vOELjcerQtoRRWydbUORzc/N1r6ZmeIHXppXD8rZ1GJSmw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qwibiTpIVAIIRlPxir6Hwk8ICqhrG5+WMRYiwkmnUA7kTv+HLTf/14oeqLw7?=
 =?us-ascii?Q?GZwpNMNj8HnrEuIg89zpWPMr3fNbYe3mn3UfYvnYT3MdspGBB94MwAwuCW1N?=
 =?us-ascii?Q?w7K5nLcKmhZnAQBtFx3BI7yHiWTrL3FAV/QlVXlzXOEWqWCw1AKJREVk/Sw2?=
 =?us-ascii?Q?RHRqvN6KM6zTat5civ01shnGmv5zLl8vMNessIQRz7HmnF1XJM9qMJsR15hT?=
 =?us-ascii?Q?m2tRY9f+bFaP5sPR0TFmrS53cziFj93d5DbmEzv1tTfhMh1ZmCwRHL2DOquU?=
 =?us-ascii?Q?EdCFd+PfjivSZuSiLmkZCY7w1A3jUpQgSsoFnHICgxijb9pzY+/IArkhdH36?=
 =?us-ascii?Q?B3gIHZDYeVSNIABFGie5/fAldeRbtUUy70Y4basx9aZ3yJZlrKHwwb9LfmGm?=
 =?us-ascii?Q?3MJUMqRJxSzX/qpL0XJnZWOi5bN9cf75s4riDDIyJfG2fJDr7fRMz5hU/U7G?=
 =?us-ascii?Q?Iny7UG8CqH/+zzsp8ubnjOkbqyAZOgW0AqoHBrN37aBvRSN0HKmMJ9gCyC5f?=
 =?us-ascii?Q?KKIPWNXu32QLVWgwrTFjOR1D7iJQcFZYtC1rBTGxLzeJbfd++VSiDCDbrofA?=
 =?us-ascii?Q?sPqt71JQigHZK/tGNh594ODeVkAmTYRC8DRIXWBUZgsc11YfFH/+1mp6XMLM?=
 =?us-ascii?Q?DMzKtM/mfa0L/D9hvYdrVwxC5eQ1wMzwA9aw6XNmwMhgsMo0TCHUz2tLJwoC?=
 =?us-ascii?Q?r45gKM8VnhCP0FMyn25HwsmQyNMPJiwfyQdfZaGuI5w4zNniWR3b3LsrBwbS?=
 =?us-ascii?Q?EpwzljcQuPu/Gx/kjcH8B9AwMdG5TuCARH8R3599VVe+UeOdd4OoqRuAodRO?=
 =?us-ascii?Q?Yi7mhT6bdnoFSffaAQ9/ixMraQWJO/e5AUoQZWbdRLzvxzDxK/1CeKey996R?=
 =?us-ascii?Q?xT4iLPchrIctq62STRijt+vsjfpJ+BQs6uIqPf9627nqTNd8yICsgR4ZDvBS?=
 =?us-ascii?Q?QxCWv1pXajayxfU98OKuR3Wl81NASrT6Huq9am25Vp1v1ftV4oUNP/FDMuyT?=
 =?us-ascii?Q?O2RAtbEQ77P5ozLl6sOrY5NpWy33j+qK5zt2KhzAeaRNOvdNffrpXy9QTWlh?=
 =?us-ascii?Q?+m9otJRj+vcG6dJk3jcoHgY9HGGhkmNHosR7+DYS8OiWYEyCPyR4XhKdbH4/?=
 =?us-ascii?Q?9FgP1VLl92iyEMGx+fcCrcc0HrV7IcPVmddVm+pt8UypnEN8ILsRg4fJmmGf?=
 =?us-ascii?Q?0wmJe6AWH0swO2EsgLSAaFMIC4ptwEnGimZaa8NvJ+eju8x8R1OxvOqgmgce?=
 =?us-ascii?Q?eqNEU14J0HOcRlMs1UxZUbHIt2dtaUJdBONtyG4enaSr/MN6cQvaCCqP0x8k?=
 =?us-ascii?Q?wHOM/4orj7T1hrX0EanjYmV9b9tQvpojtSIO+1l/DLEePmD/QW0pWElQK9b7?=
 =?us-ascii?Q?c1ttT4l+Jm3kasTlsIoUMiCRXlGTTwGXHuGWNu3vQsWKlE8IV/RAHnIOm+1k?=
 =?us-ascii?Q?Z7fbZ5zCaQwiEO9HnvCGnMgGQV0a+KIUCIbZVtIwBUvyqPPbUI9sbsLn7jDp?=
 =?us-ascii?Q?tCb6gwW31a7MjfSiOlGMcIiik9rokDt8hJwwc0em+iZvMtSjrwGtaM1Xrck0?=
 =?us-ascii?Q?NLt1xQz9OoCwKxego9dqYOL2QmhiTLaT/9zHpere?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 22cc7418-eee5-498c-5103-08dc842ae215
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 00:11:29.5747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7FcOBrf3f9xQIXLBkjNhetaf79TgG21MUR31M0tXdojZY5BG/oxagFYniF6dpmG19XsLWqAzmeBUPY9rVM3nNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR18MB5309
X-Proofpoint-ORIG-GUID: iLAaSW-o3GwsuDPeW2vsjCGXRd7OKC3m
X-Proofpoint-GUID: xe7wjTbwEM0WXOmCGOnAntUDcja9EkK1
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
> Subject: [EXTERNAL] [PATCH v10 07/13] admin: Add device resource objects
> admin commands
>=20
.
.
> +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}
> +\label{par:Basic Facilities of a Virtio Device / Device groups / Group
> administration commands / Device resource objects /
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE}
> +
> +This command creates the specified resource object of \field{type}
> identified by the
> +resource id \field{id}. The valid range of \field{id} is defined by the
> +device in the related device capability. The driver assigns the unique
> \field{id}
> +for the resource for the specified \field{type}.
> +
Is the valid range defined by device capability or driver capability?
What if the driver has set the resource object limit capability that is
smaller than the value published by device capability?

> +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE, \field{opcode} is
> set to 0xa.
> +\field{group_member_id} is set to zero.
> +The \field{command_specific_data} is in the format
> +\field{struct virtio_admin_cmd_resource_obj_create_data}.
> +\field{resource_obj_specific_data} refers to the resource object
> specific data.
> +Each resource uses a different \field{resource_obj_specific_data} and
> is described
> +separately.
> +
> +\field{flags} is reserved for future extension for optional resource
> object attributes and
> +is set to 0. Each resource object uses a different value for
> +\field{flags} and it is described separately.
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_resource_obj_create_data {
> +        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
> +        le64 flags;
> +        u8 resource_obj_specific_data[];
> +};
> +\end{lstlisting}
> +
> +When the command completes successfully, the resource object is created
> by the
> +device and the device can immediately begin using it.
> +This command has no command specific result.
> +
> +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY}
> +\label{par:Basic Facilities of a Virtio Device / Device groups / Group
> administration commands / Device resource objects /
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY}
> +
> +This command modifies the attributes of an existing device resource
> object.
> +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY, \field{opcode} is
> set to 0xb.
> +The \field{command_specific_data} is in the format
> +\field{struct virtio_admin_cmd_resource_modify_data}.
> +\field{group_member_id} is set to zero.
> +\field{id} identifies the resource object of type \field{type} whose
> attributes
> +to modify.
> +This command modifies the attributes supplied in
> \field{resource_obj_specific_data}.
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_resource_modify_data {
> +        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
> +        le64 flags;
> +        u8 resource_obj_specific_data[];
> +};
> +\end{lstlisting}
> +
> +This command has no command specific result.
> +When the command completes successfully, attributes of the resource
> object is
> +set to the values supplied in \field{resource_obj_specific_data}.
> +
> +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY}
> +\label{par:Basic Facilities of a Virtio Device / Device groups / Group
> administration commands / Device resource objects /
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY}
> +
> +This command queries attributes of the existing resource object.
> +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY, \field{opcode} is
> set to 0xc.
> +\field{group_member_id} is set to zero.
> +The \field{command_specific_data} is in the format
> +\field{struct virtio_admin_cmd_resource_obj_query_data}.
> +\field{id} identifies the existing resource object of type \field{type}
> whose
> +attributes to query.
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_resource_obj_query_data {
> +        struct virtio_admin_cmd_resource_obj_cmd_hdr hdr;
> +        le64 flags;
> +};
> +\end{lstlisting}
> +
> +\begin{lstlisting}
> +struct virtio_admin_cmd_resource_obj_query_result {
> +        u8 resource_obj_specific_result[];
> +};
> +\end{lstlisting}
> +
> +\field{command_specific_result} is in the format
> +\field{virtio_admin_cmd_resource_obj_query_result}.
> +
> +When the command completes successfully, the attributes of the
> specified
> +resource object are are set in \field{resource_obj_specific_data}.
> +
> +\paragraph{VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY}
> +\label{par:Basic Facilities of a Virtio Device / Device groups / Group
> administration commands / Device resource objects /
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY}
> +
> +This command destroys the previously created device resource object.
> +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY, \field{opcode}
> is set to 0xd.
> +The \field{command_specific_data} is in the format
> +\field{struct virtio_admin_cmd_resource_obj_cmd_hdr}.
> +\field{group_member_id} is set to zero.
> +\field{id} identifies the existing resource object of type
> \field{type}.
> +
> +This command destroys the specified resource object of \field{type}
> identified
> +by \field{id}, which is previously created using
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE command.
> +
> +This command has no command specific result.
> +When the command completes successfully, the resource object is
> destroyed from the device.
> +
> +\devicenormative{\paragraph}{Device resource objects}{Basic Facilities
> of a Virtio Device / Device groups / Group administration commands /
> Device resource objects}
> +
> +The device SHOULD complete the command
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> +with \field{status} set to VIRTIO_ADMIN_STATUS_EEXIST if a resource
> object already exists
> +with supplied resource \field{id} for the specified \field{type}.
> +
> +The device SHOULD complete the commands
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY,
> +VIRTIO_ADMIN_CMD_RESOURCE_QUERY and
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY with \field{status} set to
> +VIRTIO_ADMIN_STATUS_ENXIO if the specified resource object does not
> exist.
> +
> +The device SHOULD set \field{status} to VIRTIO_ADMIN_STATUS_ENOSPC for
> the
> +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE if the device fail to
> create the
> +resource object.
> +
> +The device SHOULD complete the commands
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY or
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY commands with \field{status} set
> to
> +VIRTIO_ADMIN_STATUS_EBUSY if other resource objects depend on the
> resource object
> +being modified or destroyed.
> +
> +The device MUST allow recreating the resource object using the command
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE which was previously
> +destroyed using the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY
> respectively
> +without undergoing a device reset.
> +
> +The device SHOULD allow creating the resource object using
> +the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE with any resource
> +id as long as the resource object is not created.
> +
> +The device MAY fail the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> even if the
> +resources within the device have not reached up to the
> \field{max_limit}
> +but the device MAY have reached an internal limit.
> +
> +When a capability represents a number of resource objects, the device
> SHOULD
> +allow creating as many resource objects as represented by the driver
> capability.
> +
> +The device MUST NOT have any side effects on the resource object when
> the command
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY fails.
> +
> +The device MUST complete the command
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY
> +with \field{resource_obj_specific_data} which is matching the
> +\field{resource_obj_specific_data} of last
> VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE
> +or VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY command.
> +
> +On device reset, the device MUST destroy all the resource objects which
> +have been created.
> +
> +\drivernormative{\paragraph}{Device resource objects}{Basic Facilities
> of a Virtio Device / Device groups / Group administration commands /
> Device resource objects}
> +
> +The driver MUST not create 2 resource objects using the command
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE of the same \field{type} with same
> +\field{id} before destroying them.
Can this be simplified to
"The driver MUST not create a second resource object of the same type with =
same
id using command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE before destroying the=
 previously=20
created object" ?
The phrase "before destroying them" seems confusing. It suggests that 2 suc=
h objects
could be destroyed though they are not allowed to be created.

Regards
Satananda
