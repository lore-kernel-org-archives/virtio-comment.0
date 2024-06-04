Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831662C80
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 00:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717459904; cv=fail; b=sU1siYsJ7JlMsoKojQym2n70M8I1h592asfOGxpp4LnXTLiCgk8I1Qdm2tuu/Ixltr6lw1zfPEI5GHm5kutb5V3kt8XBmNmXYehDtxP7Oax4PR+fUHCKY6UQDaTAol725zCV4blW5mrGPvyx2jc8pCYitDo+49TOyXCawIDKG6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717459904; c=relaxed/simple;
	bh=dzGoxQowfY41wNoDrUawr2fBsgV2sEYYC5BFM7qpF0M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Sqpn3R8QHjV1UUZvz0cZH/2yF55SbS4K55oavSiItox/PnV68oCzUnmY91Dv3vKr7uvyp6jC7i6HXmJP9g9XDKOVDrV4FpGo3/efE+fynOERE2ELneCOkhTJwUkWS5nAZbul4HWvK4s0jSEWLH7GLkhYdwPAV4j3DozsItTnA8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=rdIqGJWy; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="rdIqGJWy"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453J3BGU006605;
	Mon, 3 Jun 2024 17:11:39 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3yhb3wav56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 17:11:38 -0700 (PDT)
Received: from m0045849.ppops.net (m0045849.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4540BcMP014139;
	Mon, 3 Jun 2024 17:11:38 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3yhb3wav54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 17:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lli6/vwPJHYoWXrFJxBGl6+a2dNfiA+VKaRIfdTrj6HFVHPxWnd2i9YPy5f9c8kjtqLXjWNuh2S4xQiGgH4sStJSGPUiKBkTKlGVgg9W4H6/qBr1Ufui3ogSoMs/OavH3M/g8t7hOUKYKf2kM2PHLa9DAokQ3qpcoc7hRAFWIoW0/JMMjGytwEdE+FtS/Z8NY4uhvw44JvHoIK7EDrDF6h0FGxJuoNLxDdoonwq+qlNnSnulltXUDb6hVgs1sU3jKuFSySXCUNxAY97E1BNRPTdoRveLj/EnP74s7q2cX32AidEJOnXNW1VvlWVtPK+4poVjFif/XZS4z4yDYbPJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FioCHspEzmemqUzdhhqBGRynRDIyQWDOErI9/kbuvM=;
 b=Glpcw69avfjxtwpU0bpm1dy53dzoNEzseUGHEIRmknLabnyQZ0h3weWP0N6DdYfNBq0QDOxAGBtvP2vQWpDM7dpb1VG0/iCvvjtbMHc8XCTe5cxKdDhVQeR7BKcLawGkfwaN98HWhcmwbHcWlJ6LWPmR43aG8lOJrmhdUc+aVN305FBWBpnQRbQukRyZ6f/paFSTC+5B5NDzcSPNJf5/RALbfkJplMXFfOXNzCpGUMhQzSUIUb590wge1Z9MAXbF+Hnl/2Sd5+1HsJCJNPCzySChAjy16KPCSScj64VFdqBywtXstMygu28NYKmjobmbeHP7G6mzWEK/8UYE+Ag90w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FioCHspEzmemqUzdhhqBGRynRDIyQWDOErI9/kbuvM=;
 b=rdIqGJWyfNy0GTURrq7GDMHFAlMSAsM+6HCk4G4aPRhouxGbp4XCc4ws+cv5qMoMdkCZ80Y1zyltVzW0trvFT7DlIahzIFY70U0ClPvMEoGR5YUSlEWBSCiE3VcKHxauJK2cAMyq7FoWUg4TaQbYcwG0V6/jDuFSb3LlwwiWc9c=
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com (2603:10b6:a03:304::23)
 by PH8PR18MB5309.namprd18.prod.outlook.com (2603:10b6:510:238::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Tue, 4 Jun
 2024 00:11:32 +0000
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b]) by SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 00:11:32 +0000
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
Subject: RE: [EXTERNAL] [PATCH v10 09/13] virtio-net: Add flow filter
 capability
Thread-Topic: [EXTERNAL] [PATCH v10 09/13] virtio-net: Add flow filter
 capability
Thread-Index: AQHaq3q/O78988ibHUewVO9eFj4oWbG2x0BA
Date: Tue, 4 Jun 2024 00:11:32 +0000
Message-ID: 
 <SJ0PR18MB44775B0E116795E382A074F8C3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
 <20240521122937.2004180-10-parav@nvidia.com>
In-Reply-To: <20240521122937.2004180-10-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|PH8PR18MB5309:EE_
x-ms-office365-filtering-correlation-id: 7f949c99-61b2-4017-ae46-08dc842ae3fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|376005|366007|7416005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?kI9YbN/kX//0K5vH8+9jvFu7tQlXXAaInV49HMrUqnkDkOZC7pdFW27tm7Pd?=
 =?us-ascii?Q?aPPiQNL/fhVlJVzrHUW9dYBXoc+fudUw5k79ODtKg8OWFetXeLEyDRWW6TYW?=
 =?us-ascii?Q?Jqr9pCFzjR9HrUh0HTYCjfhukHMLd0Hsy9lFAR0Io6x9zx7k0OSAGRg8xhLf?=
 =?us-ascii?Q?oObrFr61FRUfXW2XlL8Cu9KI9KdRjWO8eoiLGAFArwLc/sY34W4bXg//cEuE?=
 =?us-ascii?Q?Pw+j54fG6Hkk1XFaFikAeGecwvT45iRR2xeiQJLTHyj8iGsSp/mAdpAFKDu7?=
 =?us-ascii?Q?PIWoRmkIQqfmouYe8vDKLVkMRjky1iPgaGkUWy90lDazd18/fw6wBOIknPW9?=
 =?us-ascii?Q?eDyDXC1LL1FlYgz8jNd4i3iyoEqVtUfRa3I9ljeIt5NwusgGsfgit3Chkpre?=
 =?us-ascii?Q?mRc0UCGRsJdk42Mbf3mhPMmmYLzsyU9ujW9WyGqzTml7gLXeoDfQ8w0FKXBi?=
 =?us-ascii?Q?u8NZ7Io4QzV3INLII7wEH97DMMoNlCrIISnEDOieljAr1cpXfggXxDOIcCaf?=
 =?us-ascii?Q?Gvw/ylYQqbRbcTPunsNTXsr2y0VK1Ibp6r+73WiX34NNsu0RGBkPG1U04sgY?=
 =?us-ascii?Q?gt27dzzv9dv9fB3fzHchWYOFG2jGB6vqwOc7kcOPWhXVR1X4Tr73sSrwt2Ip?=
 =?us-ascii?Q?VeQheUAflgycGLOCOQ/f0c6xTzqhNcqnZ+sfgYPk4jcFQsAeqSiJDPybNedA?=
 =?us-ascii?Q?IVlJ+bKKX4j9MAkOypvkiX8uaAZy3YV2y5hpgCx9N8uP3rM+dt6GT/lDbf14?=
 =?us-ascii?Q?5gvqm/ue9D6vdeUu6LO2D+5A9Eb3AU3j00T0lBiqUt0oHVP2FpKiaGhnYvE9?=
 =?us-ascii?Q?bvDAfDC8LA+uB55S+Z9vE3/qBKZCKQ8hrfu7xdSIE7dTxSPBw8gXOuHBzUkD?=
 =?us-ascii?Q?77U3BCXwWl3tMY9sEvY4QmAhri3SiWb0keXzPyPUIXzpwDZbFwZ1RxGqdeVu?=
 =?us-ascii?Q?v2xVlH3S07nddSq58cV04R/ofgRJ9m7zylOxN34bX2LxbOArBUSJXg512F66?=
 =?us-ascii?Q?6Aha/VCdmm/28AHnwGNo/J9sR9Lk4ijZ0YyPTMHe/lamveMlEfobDaNnVbWC?=
 =?us-ascii?Q?a/k8ELiIYxk3BpDFTXvJizYuhfU9y+3ocm6t1CsFv7iJiAxv8lhnkAAXdFBh?=
 =?us-ascii?Q?ekMmY/Z9V1HMr3LgwN8K0lDjPL4saPZLnRSrAUs4Al+arlAiSkMhAb5xY++j?=
 =?us-ascii?Q?im5vyn1Zk2p9RwdhFy2i1db9NEfZLt8HhaRc+JVzS/X1ydVVD/sNmF2Y3Nyl?=
 =?us-ascii?Q?tdM3dcflJJCDVEHhvvdExo0fbtzJpNK4QZSux03xuc7Dn5+AYzSjRXJANEfT?=
 =?us-ascii?Q?LRdpCJcPPu0LmoIQphw5KqZaj3VPhirYZpc03P1cJm5t+Q=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1xDCRl6nJ+Vqp7K1XqrFQiYeNad7uHOWXocCkCIj49PEShz+/D2cK9ycl86P?=
 =?us-ascii?Q?40KJlLIQFKs6WEaHvW5gPTitI5UvorYG///cxRvQJWbW2Tsw1gSTeplVfs91?=
 =?us-ascii?Q?3U3sTVer70MFxJIWeHVRVQe8KzNC5cpHjSoU8k+E1eil1Q6iZN+/4OZCA8ql?=
 =?us-ascii?Q?4to63SQJiEdxQCsI3seu+r249AlZgrBYx3xqA0z3Wc4fkKI/Ebmz9OZwl5bg?=
 =?us-ascii?Q?tytRWZc/mJwmEpfnisg52fhHdqCwkiHLSdkVARz/4WSBnPo1UA0HPxg6IDBS?=
 =?us-ascii?Q?gJiF+q4vAHH6cxhCzjjGCj+dWKit3zfymDawcOHAeoQopsIBwIva2KL9oEdr?=
 =?us-ascii?Q?aUtLXgzjVuH8AaE0/lBZpNMrOCuv6sormhwq8z36oLBdeNLWy6rZ7wPAuSQh?=
 =?us-ascii?Q?1huJ3E6pi7Mboh8hYdcM3msGAAmx3WOoGsaqHMZoXlTKXxC3wXbabDKY92fb?=
 =?us-ascii?Q?z4E5HdMldOPvd7i8mTyu5Py0Meit8df9NmwfXGdqCgvjlV+dQZRd2JX0Lw/g?=
 =?us-ascii?Q?bdGsmtrguRgeQ4u4UxTuBruv1JCEuoppU/niT0H/VFYt97u259qLp1bWYtGB?=
 =?us-ascii?Q?s2f20eiDTT+RDjfu0niXaowdVfCWRNQz7P6/eRPumg8ynMuddiQ5Ul9qhXq4?=
 =?us-ascii?Q?y9MeOqzCjw6A/NeCuZl6JsAbHXBiDMTaoYuZZOQhK+MlKQsETX7Jut34/0D8?=
 =?us-ascii?Q?OmuYgIJmQLOdnIPAlrejLSauPhCjawMZUAg8xH3Zk2SgmySZBOKqn2MVPEEg?=
 =?us-ascii?Q?atHmiTUqsekMxUW3coZn7YhI4B249njttqt+6f9V+8gvH7Ew10+7sY3qb5T0?=
 =?us-ascii?Q?WMnAlz6AYDu837J50AXaW9/AGwBc8Dx45XhqfVGZDOQdU+bmZ+qXQc4fFbUJ?=
 =?us-ascii?Q?Ys2HOXwMQW7MLsruhVo2kkvhbZ6sjPtqVTxZD7emmar14776QUMYu9eEiQ3Q?=
 =?us-ascii?Q?/4VUmVXeOnUTPmLkKio0xCZ1Xqytoe8OT119Az3LNWZNH6xGjN/G7Svj2qD4?=
 =?us-ascii?Q?ffZId+m3kFtZcEvzlSjEY1V999H/KaQqz6wSxE8z77npkBPyJVBGxOO1TgVf?=
 =?us-ascii?Q?ig0BdNdciMRqAxEiEcS43RndWVXDeoWVjoH9W8lRlxuvHPiWl8yBeZEhKFC7?=
 =?us-ascii?Q?lyemPSe4srBv6BdB1SfXpm48UaCSfw2VpwzmKivR3ySi09pIfj9hWYD0Le7G?=
 =?us-ascii?Q?JuXEyv9yC6DwkrWtj9jApK+CHQ6NIMXgQi+2yorC6yc24zGKishSn57uVFGd?=
 =?us-ascii?Q?6rOwwjRCtgvtpnMc4GeGBUT+rdCgLnWqwLo7J8kF5beWVff+Y2Ggtlb7q+ZL?=
 =?us-ascii?Q?QmMfshdsPbq1Oxv3MiR9PP9UVvVUpk4IFeKWtGX7mdqZ0ZrYxW2B91THxTbT?=
 =?us-ascii?Q?R+JRCkpDKY9uAcwHJDwW9Krf4QnFYRyM37QR1GnLZzdBbBFaJE0YU2JebUWS?=
 =?us-ascii?Q?79j4ONsfpV5CTP2/CNv3nrZW/VX7v3k8UHlyafizgKarLjUutwPWGsVplBSQ?=
 =?us-ascii?Q?7bvTbo7n2I8JocZKMWF6hBaYMjzuytT5TEqkaSnuRMWNFetCJ62JTFH0KCbV?=
 =?us-ascii?Q?laY95lcG9HdpdjuPcTKhPY3HjXxgbSrBvLcm/UXh?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f949c99-61b2-4017-ae46-08dc842ae3fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 00:11:32.7828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tK0TKAytxVDj6vhbH06zVVJBkXSIOxUhY7sIwm6DI2XdltrI5EFHsHS+cudsueN0LMMm/8iZ63uhChf9dCn2cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR18MB5309
X-Proofpoint-ORIG-GUID: 0YxGTS4DPTXuXiPEJMVYgF0dJUmQWoWO
X-Proofpoint-GUID: SriMKuh-vv4z8jk_tUYTnT_PYMnEEBsl
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
> Subject: [EXTERNAL] [PATCH v10 09/13] virtio-net: Add flow filter
> capability
>=20
.
.
> +\subparagraph{VIRTIO_NET_FF_RESOURCE_CAP}
> +\label{par:Device Types / Network Device / Device Operation / Flow
> filter / Device and driver capabilities / VIRTIO_NET_FF_RESOURCE_CAP}
> +
> +The capability VIRTIO_NET_FF_RESOURCE_CAP indicates the flow filter
> resource limits.
> +\field{cap_specific_data} is in the format
> +\field{struct virtio_net_ff_cap_data}.
> +
> +\begin{lstlisting}
> +struct virtio_net_ff_cap_data {
> +        le32 groups_limit;
> +        le32 selectors_limit;
> +        le32 rules_limit;
> +        le32 rules_per_group_limit;
> +        u8 last_rule_priority_per_group;
> +        u8 selectors_per_classifier_limit;
> +};
> +\end{lstlisting}
> +
> +\field{groups_limit}, and \field{selectors_limit} represent the maximum
> +number of flow filter groups and selectors, respectively, that the
> driver can create.
> + \field{rules_limit} is the maximum number of
> +flow fiilter rules that the driver can create across all the groups.
> +\field{rules_per_group_limit} is the maximum number of flow filter
> rules that the driver
> +can create for each flow filter group.
> +
> +\field{last_rule_priority_per_group} is the highest priority
> +that can be assigned to a flow filter rule.
Why is this called last_rule_priority_per_group if this applies across all =
groups?
Or why not just call it last/highest_rule_priority?
> +
> +\field{selectors_per_classifier_limit} is the maximum number of
> selectors
> +that a classifier can have.
> +
> +\subparagraph{VIRTIO_NET_FF_SELECTOR_CAP}
> +\label{par:Device Types / Network Device / Device Operation / Flow
> filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP}
> +
> +The capability VIRTIO_NET_FF_SELECTOR_CAP lists the supported selectors
> and the
> +supported packet header fields for each selector.
> +\field{cap_specific_data} is in the format \field{struct
> virtio_net_ff_cap_mask_data}.
> +
> +\begin{lstlisting}[label=3D{lst:Device Types / Network Device / Device
> Operation / Flow filter / Device and driver capabilities /
> VIRTIO_NET_FF_SELECTOR_CAP / virtio_net_ff_selector}]
> +struct virtio_net_ff_selector {
> +        u8 type;
> +        u8 flags;
> +        u8 reserved[2];
> +        u8 length;
> +        u8 reserved1[3];
> +        u8 mask[];
> +};
> +
> +struct virtio_net_ff_cap_mask_data {
> +        u8 count;
> +        u8 reserved[7];
> +        struct virtio_net_ff_selector selectors[];
> +};
> +
> +#define VIRTIO_NET_FF_MASK_F_PARTIAL_MASK (1 << 0)
> +\end{lstlisting}
> +
> +\field{count} indicates number of valid entries in the
> \field{selectors} array.
> +\field{selectors[]} is an array of supported selectors. Within each
> array entry:
> +\field{type} specifies the type of the packet header, as defined in
> table
> +\ref{table:Device Types / Network Device / Device Operation / Flow
> filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP /
> flow filter selector types}. \field{mask} specifies which fields of the
> +packet header can be matched in a flow filter rule.
> +
> +Each \field{type} is also listed in table
> +\ref{table:Device Types / Network Device / Device Operation / Flow
> filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP /
> flow filter selector types}. \field{mask} is a byte array
> +in network byte order. For example, when \field{type} is
> VIRTIO_NET_FF_MASK_TYPE_IPV6,
> +the \field{mask} is in the format \hyperref[intro:IPv6-Header-
> Format]{IPv6 Header Format}.
> +
> +If partial masking is not set, then all bits in each field have to be
> either all 0s
> +to ignore this field or all 1s to match on this field. If partial
> masking is set,
> +then any combination of bits can bit set to match on these bits.
> +For example, when a selector \field{type} is
> VIRTIO_NET_FF_MASK_TYPE_ETH, if
> +\field{mask[0-12]} are zero and \field{mask[13-14]} are 0xff (all 1s),
> it
> +indicates that matching is only supported for \field{EtherType} of
> +\field{Ethernet MAC frame}, matching is not supported for
> +\field{Destination Address} and \field{Source Address}.
> +
> +The entries in the array \field{selectors} are ordered by
> +\field{type}, with each \field{type} value only appearing once.
> +
> +\field{length} is the length of a dynamic array \field{mask} in bytes.
> +\field{reserved} and \field{reserved1} are reserved and set to zero.
> +
> +\begin{table}[H]
> +\caption{Flow filter selector types}
> +\label{table:Device Types / Network Device / Device Operation / Flow
> filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP /
> flow filter selector types}
> +\begin{tabularx}{\textwidth}{ |l|X|X| }
> +\hline
> +Type & Name & Description \\
> +\hline \hline
> +0x0 & - & Reserved \\
> +\hline
> +0x1 & VIRTIO_NET_FF_MASK_TYPE_ETH & 14 bytes of frame header starting
> from destination address described in \hyperref[intro:IEEE 802.3-
> 2022]{IEEE 802.3-2022} \\
> +\hline
> +0x2 & VIRTIO_NET_FF_MASK_TYPE_IPV4 & 20 bytes of
> \hyperref[intro:Internet-Header-Format]{IPv4: Internet Header Format} \\
> +\hline
> +0x3 & VIRTIO_NET_FF_MASK_TYPE_IPV6 & 40 bytes of \hyperref[intro:IPv6-
> Header-Format]{IPv6 Header Format} \\
> +\hline
> +0x4 & VIRTIO_NET_FF_MASK_TYPE_TCP & 20 bytes of \hyperref[intro:TCP-
> Header-Format]{TCP Header Format} \\
> +\hline
> +0x5 & VIRTIO_NET_FF_MASK_TYPE_UDP & 8 bytes of UDP header described in
> \hyperref[intro:UDP]{UDP} \\
> +\hline
> +0x6 - 0xFF & & Reserved for future \\
> +\hline
> +\end{tabularx}
> +\end{table}
> +
> +When VIRTIO_NET_FF_MASK_F_PARTIAL_MASK (bit 0) is set, it indicates
> that
> +partial masking is supported for all the fields of the selector
> identified by \field{type}.
> +
> +For the selector \field{type} VIRTIO_NET_FF_MASK_TYPE_IPV4, if a
> partial mask is unsupported,
> +then matching on an individual bit of \field{Flags} in the
> +\field{IPv4: Internet Header Format} is unsupported. \field{Flags} has
> to match as a whole
> +if it is supported.
Does this mean partial matching on other fields like source/dest ip=20
(something like 0xFF000000) is supported for IPV4 even if partial
mask is not set ? In other words, why is flags field of IPV4 header
special ? Does it not apply to all fields ? (i.e. the entire=20
field has to be all 0's or all 1s if partial mask is not set)

Regards
Satananda
