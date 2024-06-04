Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EE913CFA3
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 17:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717521377; cv=fail; b=esHqPCflzjlxpRC1ivVMCiG2Ivd0X4lxhMslxg9MhYyjrkW5fORAwrcrpZw1Kzv8GkNgnV+liLeaBuCTHHLHDaH1BQbepXD25/IkBnaPl/hB+4RtcK/5TaEbKGL6D4Kn9ChZpUA63SRzwuVgPZCJGIapHIzGNmBYtw9vtlPsNZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717521377; c=relaxed/simple;
	bh=4uC7dQpKoslA43N9kO/FvF4ggM90KHHWuObIDF+/1D0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hYvOsUi9U+tumid+YlqUssx0M/Ffm6M/Tq9Lfsf2AFy03avoKHehOQF7jKjwVk/xEH/N+fpgiIBV/B3lJXVZNil45tcdytV28GEQwQQomvg4vU8PUWj5PAv8fFHw/E8mW/EuAvUMkBIW+YcPOVzd1eIg6H9bdSaT72T+bBPI2ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=dGaYXRz+; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="dGaYXRz+"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4549AmRx030329;
	Tue, 4 Jun 2024 10:16:09 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3yj02n24rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 10:16:09 -0700 (PDT)
Received: from m0045849.ppops.net (m0045849.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 454HEBs3029293;
	Tue, 4 Jun 2024 10:16:08 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3yj02n24r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 10:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDU9R4g4JxW7o/MgmTHb/uYCc1wUmkxF4+gMdYWu0nRozcnuamYCqWxfNZEFllhZleWfBZe94rf2DpcNHi82GBoFfw3YB51KM7LJQnEQc1c22eN5aSs1t8Uc3UAzLMvp1338w2smeEip6LrL54CeMpMmrDBYAvl6dC70/oDpGZsIjFIZSl8DvBUKQbztvzFobm8OEhmGdmKu46GaYvKgCsTZOOSj+BfvQUFWNsINJZesoO+AigHPpSQ+28DPHcSZgCyknN0qQrQGz0YdkVWe0H3r+ouL8ZxFk1vtUBOKguukM8EsY3bYGQer90IN+Nn1nkOFWpvHbLDS/8fjQSzg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCOdmPU/rtX12l2PyHncPWZhLC6++zwsb7wzfaoREHE=;
 b=MX+IfV79mgntHs6xnplpPR4ryaN3diC0MrZ+G3bxvUqDL3IjnE7fp0+moF7tWUX9h3UxkTQ1aoXPoj3q5IUqMjuE6GSZW7ZZOt4HvYm5ZAAtyB1XqBOxDhNt5qRvL8dcyDa8lR++siJL68xjqKuEaOcRCMaUvlLuCzuT6rMLW7VjULo0r7aF/YuU62lhTun3sAn+zMhXVK1sBLVbjKM0hf9WXJuq8+UBlwnFc0x7bYMM6dandv73JW6h3NkKGeAPGiUw4tPzqODzsokvFahF9xbfWqIXt1z0NfwY7vykznzSSx+gKJvYLm9aNssfD/XY6Uuczbhe+WVqTuKXHh18Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCOdmPU/rtX12l2PyHncPWZhLC6++zwsb7wzfaoREHE=;
 b=dGaYXRz+5QxV+mJ3075mEp1MGkdlUZs6BmXs2qe7WPTeh9fQIKAc7e90v7oNR9DzuZwf9LA0dp/kGJV7zbF+lyFDEb9QwD4GGnTHXB/raFX7tWo2b+o/3dTjYAQ4iScvMly6jyyFEmfFoYkFZDpmDc8oHR660/+S0gnVnDLPBgc=
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com (2603:10b6:a03:304::23)
 by BN9PR18MB4233.namprd18.prod.outlook.com (2603:10b6:408:137::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 17:16:00 +0000
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b]) by SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 17:16:00 +0000
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
Subject: RE: [EXTERNAL] [PATCH v11 00/13] flow filter using basic facilities
 of capability and resource objects
Thread-Topic: [EXTERNAL] [PATCH v11 00/13] flow filter using basic facilities
 of capability and resource objects
Thread-Index: AQHatoNF0eEodHa06k6O3TU3ZGx/abG31k/w
Date: Tue, 4 Jun 2024 17:16:00 +0000
Message-ID: 
 <SJ0PR18MB4477D611893522822E58602EC3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20240604132903.2093195-1-parav@nvidia.com>
In-Reply-To: <20240604132903.2093195-1-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|BN9PR18MB4233:EE_
x-ms-office365-filtering-correlation-id: 1f007227-2493-45db-10c2-08dc84ba015c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|1800799015|376005|7416005|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?qRKWsSoXIjZXYznZO1/7HZpbakRMEkof1NqKgtEHbhN20ZQCsQYuP3R3Bv+l?=
 =?us-ascii?Q?me+eOMSSVDVFVK6IRKB7qogOtSRihQSmkbjjtFhOl0hnyhJkRkeeoli2wH5d?=
 =?us-ascii?Q?IwVo6bEoBNaSJv158NL10HFOpDPvu6y+HMVLlS/F6DO9jyzHLCQoJXLHd1Bc?=
 =?us-ascii?Q?KtUGRvPI3+JTN9H/kIJWn6eBYh7C275L1qkcbcIkfZp+eH6mCeIAtNAfb8lp?=
 =?us-ascii?Q?OdofYMQR1ypx1lOHw4acZ8jFvcHmPtM5HjdvGRsMd3Y1m/a6v3gxy8vaa61/?=
 =?us-ascii?Q?bfLl2nxP4BZGhM5Fo+lLZ1D9rzCL16JiWuzeh8m3VI9nyrvF1aSEeII63viy?=
 =?us-ascii?Q?JuVP6iY7Ia2MWOURNrcMBG1yDCspS1bd2yPqi/3+CvajThaoy/uEz2u273qS?=
 =?us-ascii?Q?cZx30J12DXQKV6+4Qh3PhlWGrBrtkhH1a95DN65jiMx5XnEKrtY/cKKP07FN?=
 =?us-ascii?Q?NndsEaVsBO0qR6psXHgABnVkDD4ZMyJF/b91Hs+J6btlFKwz1ZlJouIsL7FG?=
 =?us-ascii?Q?pqp9kvXV1g1mrzVxPVKhFJ/km+uICOqC1hWgY/oP7479E9u9UsDrntkbLzL+?=
 =?us-ascii?Q?DksdigaKwNSsCmc2aLsXJkGYF7x1fVXz60U1gp5hJCyJpU3pDk6j2YyWFjlJ?=
 =?us-ascii?Q?VrNQFXe1XfN93kfImHraOnb6MRuhfSiI7j3iBeN110nFHISOBf+yFnyAuYa1?=
 =?us-ascii?Q?Aw2yEvBkWM03Pn/qnvK/ihwYr6ThP+IoVJoICT/kVoCWIsn0uOInlEojbI5j?=
 =?us-ascii?Q?Ycr6qOz0HniUZOgrOSDcePwifNDVtjdQbq4RTMgFWwLjJ8avsYKwaTj1PyIQ?=
 =?us-ascii?Q?Xrj0b1rdBYgUo6ne268sEFqXIOaFb31ApWyOUWAHrt8oLLZF7nj1tSl4Y3jt?=
 =?us-ascii?Q?OrwZqeT2iXn8zCIJNaiSC71Tn0Tq+pPGfZrSZYYrImRh0IaPS4/VBCoaUYqk?=
 =?us-ascii?Q?DXibb1J8ZW2pcwo94zI4eyrKexhYqdOF9fAp3tJv3+1bvcLRj7BgTM7CC9WR?=
 =?us-ascii?Q?YaQ1dZ5/1UJHJfVQQLEJgE5K0+RtvlPp1KpVjeE3DOkwgA11ieTSIeXqNsno?=
 =?us-ascii?Q?qbFX3WxljY2s1t1FReQmISMd3sz/LFv5YP9kHj4a5VPGqOzvjWfOjlbPaCAe?=
 =?us-ascii?Q?uX/4Yjp4JtQRO3b9s/9sLqriaPcv50hEaJgIeYQ7tC4dqSP2YrWNx/r0/PF1?=
 =?us-ascii?Q?0N82GHLgkbNzm2KJFfpI1tO2VgC0BmfRi2EiO6L8arkx5LXI2RF5fVPbTRCA?=
 =?us-ascii?Q?1H6Tl+blKY4GyZnHwGLgi6Bh6UEenvlLgWBy+NlRayRrLY/Y58gzzZfWYmVF?=
 =?us-ascii?Q?h0w=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZAZ1xXVDDrLlLUjeYOYCSB9yo5D7lHLfUL9Bi1PnA4/b92oJWNWl1RaBwhv6?=
 =?us-ascii?Q?udZuMgrJe2ynM1jpgDxbToV+fNQPpTbfehMDRxMXWtT3NxKpDj0oTRuSeZrX?=
 =?us-ascii?Q?BEGMm5aiXzreLtM1AbbV5uQP8SCxpKIMCsmZ8jikFnIToQWZlBG/l1cY++PV?=
 =?us-ascii?Q?dGpQvg8SZVTRNXygX+iDK07yoTyKa+ydpFfQ6zMY9Om96q1jz5rwQrcBtJvk?=
 =?us-ascii?Q?SQD8CS3U1jS1cbxKmY+NukvF+G6cv05YaioWZNXcaC1xXXmC3Lf0mwngvDU8?=
 =?us-ascii?Q?Yq79bgYu46FmRjFeBhKEjKJVB3DySTQJrF+QyzCTpxNuQoL+fUt1fwp0hHJX?=
 =?us-ascii?Q?ZS9BC3xKVM1mQBp17k2OmdyzgfQ1coVw0gJfJqn/fXRWGeNbNFPUyYHsgFE/?=
 =?us-ascii?Q?mVUtO2VH5RRRAhdIurKU/sUa7dmvxT9douPXV6uDClUW4t69ByDn4b0i7oqV?=
 =?us-ascii?Q?G/k5oh0tdOHt3kBv0baZu1SsKf9tythVZuv8HhMW4+LbfEAH4TRW0hyijcWo?=
 =?us-ascii?Q?Gb6sPKfVsjg4NNuy8Ich9Sv2zhxji5clcVO5NurYidKKXy0vdT6MUMKCIN78?=
 =?us-ascii?Q?b0XHVD3YI0W2D0Alz82eBDuBySOgepI53mAHwQUggOz5R0IszDg/K+mDTIti?=
 =?us-ascii?Q?6UeqrBFkJOPNsmoudrY5SoSAAyjc1y4IpTkEZkORI+np+9JJd6Cm8oiF4YH+?=
 =?us-ascii?Q?S6ueRyvIaHIuaJ9B98n+w65XOa3Ce13A/JdTHB8th7PlgrYsbk4WVlzCM4yH?=
 =?us-ascii?Q?vdG3KVs7fV/KQc+5WzTKLTVNF18SikOGALGY3F5X4N8aV9xNZVsUENQ1vIQY?=
 =?us-ascii?Q?uThBY4LPQdiuUFvttI5Qiq+neVMTDJK2YPIa7MBO88vG/fhNpb4HDQHdpcdc?=
 =?us-ascii?Q?Z5islQDlJ7wwE3687v33+qrtB59lvy2yW+m8S7SjToEY5ESAqPfiUNCSZCmg?=
 =?us-ascii?Q?+Ppkkn74LJbSiCsa611kXZCZSEVkt3lunuNCcOI+pHJfuc2/3ZPaO/SUwZ5r?=
 =?us-ascii?Q?OGq7DLD633iOm7fYE3P9p+Oboy97DbVDaud9SUQBFnBVEQ4F1FT6SLocSaW1?=
 =?us-ascii?Q?t6sbwOAY7WrLSAS6TanQ/mVTX+Tgmquq1Ly23d8IbxUYE9O2pQ6qIVWc+Eft?=
 =?us-ascii?Q?zIPOxOAO0qj2yu81d/ys0Qg3QCmMxr3pFrTy0QsKQ6FfSc8Ec/cDg+osZ+Xq?=
 =?us-ascii?Q?OzjBvi2U5PNx/ZbaUmCkaiMJxfWTy9hTutA1UiUNMidj/6ijl7kSr6cqeqBw?=
 =?us-ascii?Q?Gw3ZkcYTVA4T06uztL49KVYO7/380xQH/Y+qGrmN8r9HNMjklxu3Ru+rc85H?=
 =?us-ascii?Q?UilHF46Bwg4K/Do9yJt/jGwSEv1iEEQS+bAfp6+AkH4lmx65TDtvuQZx+dXg?=
 =?us-ascii?Q?eRVfEly5qem/7kR/3HoKb002fO9rkmVAoewh5+SRNPVJZsnM6PN3it32cMv8?=
 =?us-ascii?Q?PwmnRxvHEFi1Sty3QOE7qSwmrfTMQQ0AYKDX5oP2cXU49fMfgiR1jd1f7CXJ?=
 =?us-ascii?Q?AQG/UldnZJ2eojT2+DL24Xy3oV3XcVhbY2ISoLA1oGa+MTPC83EwqkQdLBu/?=
 =?us-ascii?Q?yAI7PZNWYjqsVfgvY+LR6tSBEXif6K9sD8A0j+Tp?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f007227-2493-45db-10c2-08dc84ba015c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 17:16:00.1147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vT9DqjNvmkhr9iWWPOG8ko9IMU0/ZwbaDh2pCtXSYbBuLrynMb0fUrJzUDURHtJQZtICBhhC5/sWkTU/neISog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR18MB4233
X-Proofpoint-GUID: hbhRWo_XLaOTz2MztxO9VbkWQcVl4vkM
X-Proofpoint-ORIG-GUID: Tv-qHu4fpfLge9WkqLOFujefPPMEnVOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Tuesday, June 4, 2024 6:29 AM
> To: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> Cc: hengqi@linux.alibaba.com; Satananda Burla <sburla@marvell.com>;
> shahafs@nvidia.com; si-wei.liu@oracle.com; peter.hilber@opensynergy.com;
> jasowang@redhat.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> <parav@nvidia.com>
> Subject: [EXTERNAL] [PATCH v11 00/13] flow filter using basic facilities
> of capability and resource objects
>=20
> Prioritize security for external emails: Confirm sender and content
> safety before clicking links or opening attachments
>=20
> ----------------------------------------------------------------------
> Summary:
> =3D=3D=3D=3D=3D=3D=3D=3D
> This series improves virtio net receive packet steering to
> direct packets to a specific RQ.
>=20
> This basic functionality will enable Linux ethtool steering,
> and accelerated receive flow steering (ARFS) as a starting point,
> and more use cases in future.
>=20
> It is using new virtio basic facilities of capability and
> resource objects described later in this cover letter.
>=20
> Those interested only in the capability and resource object facilities
> can jump in the cover leter to "Overview of capability and resource
> objects".
>=20
> Net device problem statement:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> Currently packet allow/drop interface has few limitations.
>=20
> 1. Driver cannot add or delete an individual entry for mac and vlan.
> 2. Driver cannot select mac+vlan combination for which
>    to allow/drop packet.
> 3. Driver cannot not use other commonly used packet match fields
>    such as IP header fields, TCP, UDP, SCP header fields to direct a
> packet.
> 4. Driver cannot direct specific packets based on the match
>    fields to specific receiveq.
> 5. Driver do not have multiple or dedicated virtqueues to
>    perform flow filter requests in accelerated manner in
>    the device.
>=20
> Solution:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> Flow filter as a generic framework to overcome above limitations.
>=20
> Overview:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> A flow filter defines the flow based on one or more match fields of the
> packet, defines an action like drop/direct to RQ.
>=20
> The flow filters are organized in flow filter groups so that their
> processing can be prioritized when multiple applications wants to use
> it.
> For example, user supplied flow filter rules to take precedence over
> kernel stack created rules.
>=20
> Many a time large number of flow filter rules have selection mask.
> This is facilitated by a flow filter classifier which defines the packet
> selector fields using a mask; a flow rule depends on the flow filter.
>=20
> Flow filters are handled as resource objects using administration
> commands.
> Flow filters current usage is in-between of control path and data path.
> i.e.
> a. ethtool will operate at few hundred cmds/sec.
> b. ARFS at few thousands cmds/sec.
> c. In future ARFS and connection tracking(CT) may do few millions/sec.
>=20
> For b and c in future, few options are present.
> 1. Dedicated flow filter rules management to a specific AQ so that it
> can
>    be accelerated by fast path. This can be possibly done using group
> level
>    or AQ level service class or both
> 2. Define different admin command format for fast path
> 3. Special type of new virtqueue for CT driven requests
>=20
> While a general BPF offload might be a superset of this functionality
> and
> might be desirable, it does not look feasible, in particular, from
> discussions
> with multiple hardware vendors it is clear that hardware will not have
> such
> capability in short to medium term.
>=20
> Fixes: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> 3A__github.com_oasis-2Dtcs_virtio-
> 2Dspec_issues_179&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DNHDPsfcAYlN2z=
-
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DGj1in7ZCbX1gs76rVBdr3f0K9GwIPTDRuLgZxgC=
f
> irV2iCVbv92rM0J-
> G8qxrI3j&s=3Dv66iK_00WpoV9ezR_V4SYUmL4lWsukiLoaj0Jghe3cs&e=3D
>=20
> Overview of capability and resource objects:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Config space has few advantages as below.
> 1. extendible
> 2. common way for each device to keep expanding it
> 3. provisioning to supply offset, value to set fields
>=20
> However, the combination of feature bits + common config space +
> device config space + cvq creates four different communication
> channel between driver and device, each with a varied degree of
> limitations and complexities listed below.
>=20
> 1. Feature bits cannot be modified at later stage in the driver.
> 2. Feature bits are boolean; it cannot communicate amount of resources
> and
>    configuration details. For this yet another config space or cvq is
> needed.
> 3. Making configuration space writable and also synchronizing it with
> device
>    operation is very hard.
> 4. Modifying and controlling the device operation using cvq largely
> works but
>    limited to specific device type and requires per device type cvq.
> 5. To provision features, resources from the owner device, one
>    still needs new admin commands.
> 6. It is hard to maintain and access variable length array in config
> space.
>    We have to add the fields at the tail, this means if we start with
>    foo1
>    bar1
>    later, to add foo2 it becomes
>    foo1
>    bar1
>    foo2
>    We end up with structure with mix of unrelated fields spoiling the
>    readability/aestethics/maintainability.
> 7. Any writeable config space is a problem; for example very
>    inefficient on pci as you have to read after write. It also
>    lacks atomicity across multiple fields. So to avoid writable
>    config space, and to use VQ, things spread around read_only
>    config space and VQ for read-write fields, creating more mess.
> 8. It is not uncommon to have some driver resource and number
>    of resources would normally be in config space. But to write them
>    to use VQ, and without proper resource definition it leads to
> overflow
>    for example, the overflow we experience with mac table.
> 9. Extending config space and having it accessible even before
> negotiating
>    features when the device does not know if it will be used or not
> makes it
>    hard to build the devices.
>=20
> Above limitations are overcome using new basic facilities as:
> a. capability
> b. resource objects
>=20
> Capability and resource objects are an evolution of the (a) feature
> bits,
> (b, c) common and device configuration space and (d) controlvq
> mechanism; this new
> basic facilities are intended for managing a large number of diverse
> functionality in a uniform and extensible manner.
>=20
> a. Capability:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> (1) It consists of device and driver resource limits.
> (2) It can be modified anytime using admin command.
> (3) Owner and member follows same format to get/set using a selector;
>     simplifying the provisioning and migration.
> (4) Accessing capability via the command interface makes it friendly to
>     both software and hardware based devices; possibly to operate even
>     without admin vq.
>=20
> b. Resource objects:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> (1) Define device controls in a unified way instead of ad-hoc cvq
> commands.
> (2) Can create diverse type of resources dynamically.
> (3) Ability to define common and device specific resources.
>=20
> This series defines flow filter related capability.
> This series defines three resource objects as flow filter group,
> classifier and rule
> to implement receive packet directing facility.
>=20
> Limitations/Disadvantages:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> 1. Device side configuration change notifications are not covered in
> capability and resource objects yet as both controls are driven by the
> driver;
> however in future we should be able to add it to query the changes.
> In an alternative when notifications are frequent or multiple
> outstanding,
> it is better to come up with generic eventq or notificationq like how
> it is needed for alarm feature of RTC in [1], though RTC may proceed
> in short term with its own queue for other reasons.
>=20
> 2. It can be used only after DRIVER_OK phase at present, but when needed
> it can be extended to have admin command interface to be accessible
> after FEATURE_OK and before DRIVER_OK.
> So presently capability cannot affect features, but any attempt will
> probably run in some corner case.
>=20
> 3. It is more plumbing than config space and cvq; however it is one time
> generic work that paves the road for mulitiple device types to use in
> common manner, reuse for provisioning and migration. This series itself
> uses common framework for 3 control operations of group, classifier
> and rule.
>=20
> 4. Current series is unable to provision the device, but a new
> command such as VIRTIO_ADMIN_CMD_DEV_CAP_SET utilizing all the
> structures,
> infrastructure can be done in future.
>=20
> Future uses of resource objects:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> 1. Dynamically create VQs much after DRIVER_OK phase with multiple
> attributes such as multiple page addresses, header data split queues
> for net, with PASID, inline header size.
>=20
> 2. Create dynamic counter resources for specific usage
>=20
> 3. RSS context creation
>=20
> 4. net device with timestamping capability
>=20
> 5. RDMA device resources
>=20
> 6. May be more.
>=20
> Patch summary:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Patches 1 to 7 cover capabilities and resources.
>=20
> patch-1 adds self group for admin commands
> patch-2 make legacy spec section name better to follow this series
> patch-3 adds theory of operation for capabilities
> patch-4 make table readable across multiple pages
> patch-5 adds capabilities admin commands
> patch-6 adds theory of operation for resource objects
> patch-7 adds resources admin commands
>=20
> Patches 8 to 11 uses capabilities and resources to introduce flow
> filters.
>=20
> patch-8 adds theory of operation for flow filter
> patch-9 adds device capability
> patch-10 adds flow filter group, classifier and rule resource objects
> patch-11 adds flow filter device and driver requirements
>=20
> patch-12 clarifies the newdevice section
> patch-13 describes the use of capability and resource extension
>=20
> Please review.
>=20
> This series is on top of branch 1.4 with patch [2] cherrypicked from
> master branch.
>=20
> [1] https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.oasis-
> 2Dopen.org_archives_virtio-
> 2Dcomment_202312_msg00110.html&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3D=
NHDPs
> fcAYlN2z-
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DGj1in7ZCbX1gs76rVBdr3f0K9GwIPTDRuLgZxgC=
f
> irV2iCVbv92rM0J-G8qxrI3j&s=3DltV_2-
> SVkcPmABK4gaIO6q7X1ohLEFbDmzH7r0a3gGE&e=3D
> [2] https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> 3A__lore.kernel.org_virtio-
> 2Dcomment_te6tzbegqky7uz4skrag3yowet3phtq6nn7tegyrillgb4juwn-
> 40m4gi5ohfuk7m_T_-
> 23m25e8e7bfd2e4d9e2fc42ab36750715a272b419bb&d=3DDwIDAg&c=3DnKjWec2b6R0mOy=
Paz
> 7xtfQ&r=3DNHDPsfcAYlN2z-
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DGj1in7ZCbX1gs76rVBdr3f0K9GwIPTDRuLgZxgC=
f
> irV2iCVbv92rM0J-
> G8qxrI3j&s=3DYWVkb830i_2sqHWh2asiBtdpUbQkTT1aiJly4Yvg4C8&e=3D
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> v10->v11:
> - fixes comments from Satananda
> - improved driver normative for two resource objects with same ID
> - fixed the field name to not have 'per_group' in it as it
>   applies to all flow rules
> v9->v10:
> - rephrase the self group description
> - removed duplicate description sentence in self group
> - replaced 'functionalities' to 'functionality'
> - added missing article 'the'
> - inserted patch for legacy commands to follow new commands format style
> - replaced capabilities to capability
> - rephrase for listing for device type specific capabilities
> - rephrase the first para description of capabilities
> - removed white space at end of line
> - squashed the dedicated patch of status codes with the usage patch
> - renamed read/write caps to device_get_cap/driver_set_cap
> - restrict get and set command to only self group
> - supported_caps renamed to cap_id query
> - removed length from the get/set/query commands as it can be derived
> from buffer
> - renamed cid to id as its part of the cap command structure
> - grammar corrections with article and others
> - renamed rid to just id as it is part of the resource related structs
> - removed length field from the commands as it can be derived
> - rephrase for group_member_id
> - squashed the patch that added the error codes
> - removed num_types field
> - used singular capability
> - updated example to have rtc for net device
> - introduced mask object that improves the flow rule efficiency and
>   removed fields_bmap per field type bitmap
>=20
> v8->v9:
> - changed command name from read_data/read_result to
> query_data/query_result
>   to match the opcode name and description
> - added fields_bmap bitmap to support future support of optional fields
>   in the resources without inventing new set of commands, for example
>   multiple pages in the VQ, PASID in VQ, flow counter id in flow filter
> rule
>   etc.
> - fixed spelling from 'destroyd' to 'destroyed'
> - fixed 'upto' to 'up to'
> v7->v8:
> - updated commit messages
> - updated newdevice.tex for more Q&A around capabilities, resources,
>   administration queues
> - updated resource text as non data path operations
> v6->v7:
> - fixed plenty of grammar suggestions from Cornelia
> - introduced device/driver capabilities and device resources generic
> framework
> - rebased flow filter to use capabilities and resources
> v5->v6:
> - pick next unique bit 65 as to avoid conflict with rss context feature
> - fixed missing conformance links
> - removed white spaces at end of line
> v3->v5:
> - removed left over dependencies of flow filter virtqueues
> - removed partial sentence
> v2->v3:
> - removed dependency on dynamic queue infrastucture which is
>   not yet ready
> v1->v2:
> - addressed comments from Satananda
> - squashed with match fields definition patch of v1
> - added length to the flexible array definition struct to benefit
>   from future runtime length bound checkers listed in
>   https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
> 3A__people.kernel.org_kees_bounded-2Dflexible-2Darrays-2Din-
> 2Dc&d=3DDwIDAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DNHDPsfcAYlN2z-
> NXHHG4WB09qqS0voo_nf6_kGS625A&m=3DGj1in7ZCbX1gs76rVBdr3f0K9GwIPTDRuLgZxgC=
f
> irV2iCVbv92rM0J-
> G8qxrI3j&s=3DKeh0MQpI4WCrc9erzTza0ajxx5lENMEfITacf3dc66Y&e=3D
> - renamed value to key
> - addressed comments from Satananda
> - merged destination and action to one struct
> - added vlan type match field
> - kept space for types between l2, l3, l4 header match types
> - renamed mask to mask_supported with shorter width
> - made more fields reserved for future
> - addressed comments from Heng
> - grammar correction
> - added field to indicate supported number of actions per flow
>   filter match entry
> - added missing documentation for max_flow_priorities_per_group
> - fixed comments from Heng
> - grammar corrections
> - spelling corrections
> - fixed spelling from initializaton to initialization
> - added more requirements for multiple actions
>=20
> v0->v1:
> - addressed comments from Satananda
> - added device requirement to return non zero value in fields_bmap
> - added device requirement to not repeat filter type in response
> - added driver requirement to order filter match field as it
>   appears in the packet
> - added device requirement to fail group delete command on existing
>   flow entries
> - added mask field in the type to indicate supported mask by device
>   and also in later patch to use it to indicate mask on adding
>   flow filter. As a result removed the mask_supported capability
>   field
>=20
> Parav Pandit (13):
>   admin: Introduce self group
>   admin: Use already defined names for the legacy commands
>   admin: Add theory of operation for capability admin commands
>   admin: Prepare table for multipage listing
>   admin: Add capability admin commands
>   admin: Add theory of operation for device resource objects
>   admin: Add device resource objects admin commands
>   virtio-net: Add theory of operation for flow filter
>   virtio-net: Add flow filter capability
>   virtio-net: Add flow filter group, classifier and rule resource
>     objects
>   virtio-net: Add flow filter device and driver requirements
>   newdevice: Improve the appendix chapter heading to reflect the content
>   newdevice: Extend informative guidance on capability, resource objects
>=20
>  admin-cmds-capabilities.tex             | 233 +++++++++
>  admin-cmds-legacy-interface.tex         |  24 +-
>  admin-cmds-resource-objects.tex         | 268 +++++++++++
>  admin.tex                               |  51 +-
>  conformance.tex                         |   4 +
>  device-types/net/description.tex        | 609 ++++++++++++++++++++++++
>  device-types/net/device-conformance.tex |   1 +
>  device-types/net/driver-conformance.tex |   1 +
>  introduction.tex                        |  21 +
>  newdevice.tex                           |  37 +-
>  virtio.tex                              |   2 +
>  11 files changed, 1222 insertions(+), 29 deletions(-)
>  create mode 100644 admin-cmds-capabilities.tex
>  create mode 100644 admin-cmds-resource-objects.tex
For the series:
Acked-by: Satananda Burla <sburla@marvell.com>

Regards
Satananda

