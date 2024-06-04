Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871548C1D
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 04:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717474734; cv=fail; b=nqdZ9X1IC4dzHtEL0hub1loHmE7bLDOjF3Hf2pZnwf8hnMWyByJNCAEA9uQNamKszqqUOnNMZGNUtNcbmzdkCCeQ7K5JfqdRcwNdqd/cXwAWeBSoZ3jniGR4RQ+2bnznipHdVTXrmkmIEW9ibgDvD636mZ1/eARyi35Hu64FYDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717474734; c=relaxed/simple;
	bh=IiYqsvXkP0+KxBsgsYXQKZUQop/r4AgY0FCH/dzQnI4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pE0lhSs1FuUUVQBadtdwwb+l2KaXrtDd9GZNeRIYPm6mtp6/HpiNvPFAtEfkLA9E6ZtTo1XGR7GpA+HRAcfruVkw9CBDcXLE1KThyinXLvjNr0+uP9XxYb8KvlC2zOSd6Mg2/iAAI4G/Wy9FZHrxTyqBACgiWyfQpWJGwOPD48k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Tb77pkoi; arc=fail smtp.client-ip=40.107.237.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tb77pkoi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn2x+VKzDuVF1H8e5BxuOCXcSA09RoJcS9VmCxPEmG/+gyzy+4W8/55mDjNf0qy7JO/CsnOB9/cDAqUjXTD7OgQ+BUn1+ZBdgFFjr8phNvP3ghHfYTTg8tO2aM9H6rkFLx8XuDWZMWYfO8/SQEwO5vi0QW+HyG+aetzNtnN7HhegcGHcO9n4uzs/1upnzj7pCMinHmI3UAEdhAytvdEwCQS3+gex/hyIVSSEbRp2qEHfbJ1MU/H0rWAtbJZ2E5iIdeFQjRBRQjkj3wgdZYmF1qJrbVcnD6KyKdzdxrdcVgAtcnU3oxzKrWmh6YZcdnYeA6/wmrI3GngdPR5sAJt+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiYqsvXkP0+KxBsgsYXQKZUQop/r4AgY0FCH/dzQnI4=;
 b=TyWMDtKEs+ilrHeT4ey97GNJUkpXr3KMzqsalUDO+jpFfmK0iKqn4sbl4CTxtZOMmnWDySu5zHvST7BV8eeMFlbfm4JW1geEn3wcrb0blFaHkrYNEe6tupUzE4KAUBHVqqudYdvXERevbjs3/g9FiblrxDIlqaXg5InpeeKtByDi65nBgPscTf3aAOtoibAsY81Pi6Y8u7CkHnNlM2zeWDVf7uQ7G/xTWFJ/rWY5auJHmdyRDpyMy/ETwmkD1/z7MbAvdLqQJ7w7DAh0XFkUX+pLVXbHoOIMu1tUkMuqc2dUyX5D9JE+dNpYmwmWzEtidsMJwkRzY/Vlvd5r22jqSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiYqsvXkP0+KxBsgsYXQKZUQop/r4AgY0FCH/dzQnI4=;
 b=Tb77pkoi/x5Dfpgw8MQldR15xMI0Pn2QAn+iSd1Eme8bKPC3+PiGFC2Sj/uaOP/d3Ojt4L2Ze7SbsRzFrWP8Z0qpwV0MlPyxc5AxBHB2oVHKsAb1xtPMjq3YTD1kBAmajFqhEHLQ9NTSfbpY2/11KV21aG4dUqFsvPIpM2hlEVaR5W+pG0zOWQouuKlZnaBso5poGgPSRMPFKIwWDCbs17IQlYqMhyd/7KO/PFO95AzJJ6BWA3azEFOz1+A97bzlef5BlzjAHjpXC8c5Tnz+QwxUsLYoKFg3ESS23ZRqSqfAGIInAwgPaSHCMS+/coPBgDhnv09tBExITVYhK/jOPA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Tue, 4 Jun
 2024 04:18:43 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 04:18:42 +0000
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>
Subject: RE: [EXTERNAL] [PATCH v10 10/13] virtio-net: Add flow filter group,
 classifier and rule resource objects
Thread-Topic: [EXTERNAL] [PATCH v10 10/13] virtio-net: Add flow filter group,
 classifier and rule resource objects
Thread-Index: AQHaq3q+LlUgyicIo0qc/hxXVgDbmLG20IMAgABEu2A=
Date: Tue, 4 Jun 2024 04:18:42 +0000
Message-ID:
 <PH0PR12MB5481F82A4C9F306F45B3E3E8DCF82@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
 <20240521122937.2004180-11-parav@nvidia.com>
 <SJ0PR18MB44772B48F7132C629586B6FEC3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB44772B48F7132C629586B6FEC3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA0PR12MB4399:EE_
x-ms-office365-filtering-correlation-id: 3269617b-6e6d-4d5b-9c37-08dc844d6b47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?l1wfJ2+2LUNGjZwp2fDd7PtJzRmE46gjJTir9WuZ5hxYbzpR75Z3nFtE8Igw?=
 =?us-ascii?Q?UxhvUUIb8Rqu1OP8EP3J+V7Yu99K1ehXhBxHxlvUoorNvrx5r1U8Z56jYo49?=
 =?us-ascii?Q?gQVSpuZwe89ktv1mdG0nOtdE57lnomGTOjohLTmyA10EdGybrn6eCA/FOcOB?=
 =?us-ascii?Q?FgJ+cJkQG+hajDj7S1CaHzvjixo6tbD2r9rYSZHa+uGGt5X+zxSGz2wI994h?=
 =?us-ascii?Q?c5BYB/q64NQhq3QiRuOrJU+5RvQjPnqzqW0Z+7D15H6K41uKNeMMIJgiqqN1?=
 =?us-ascii?Q?aLpfyrhP1hJNIxW5E1eXmG+Eabv5bzwdcVyVmTLTq7l8TZ8BQCpoMYCk4oKN?=
 =?us-ascii?Q?Guti6IJ1CCzOXl/pwq5YdMSg/CgiYnzvztma56JNuFU92xAsbNyFuGl3SGst?=
 =?us-ascii?Q?8HB3eeatKQzNeD6dieQAoJGreMvzZuJWITiive+KywOewn8goKSIanXfAb1S?=
 =?us-ascii?Q?f5M/APui8eytGIKrMxiQcgW0uKyCAxlK3bqUchWEmFnOYC3lrx1jRrSUxG29?=
 =?us-ascii?Q?5uZ+Dfmj50IaPrfjrZhbQgMn4I4u035Nz02JnLp/Jx2Ldpu4KxIiHhswblhw?=
 =?us-ascii?Q?HrKK+3wTI1V8/gYAk7ymqPDyiFJmV8CjVayDdK60IjHdUyLNSj5D0f/UnckO?=
 =?us-ascii?Q?+8fLbj2RheEzMqX7V9kNi3lRI7icN/WFHJUaBOR9iJ7n3Bu7zOlb11vS8k6e?=
 =?us-ascii?Q?GCZCTP4iNFWioEOIEp7nm2HY7cjTvYCvtBcu1l0jT2InQsJ/EODhYM8Av8Mu?=
 =?us-ascii?Q?5lMMntCEfEV+7x7AiTixHMQlo1zG/HpkB+pMPxPUKSl+7BdgJjf/gPUQRKDO?=
 =?us-ascii?Q?c+fqPMZ68dTD4fNJdrGNaEPtp8KHGulBu4vFt2MtTpuSQKq6fJXLF8hGq6NB?=
 =?us-ascii?Q?F0Nmh5cBHU49SPRsp13F7X/OXjIBxDEwDrU8Yv7TTaP8w5OrtsVXHzTotnZ5?=
 =?us-ascii?Q?R/CD3JA8hNoDM8Y8AXeScd/wE44Ih1OKF91kTdxuhV0sSvMRyShgis9xY4Sf?=
 =?us-ascii?Q?glrt26lbDXA/LnUcnf56A1BNu8KvJLEi6aBbAUmodfuxuaX+ef9iAcBG+viO?=
 =?us-ascii?Q?zCRp4Dm8/CW/mQjVEmSc5AxmavGPutRDYUqxxIpUb3sQIX+XL8DgvjQteYmY?=
 =?us-ascii?Q?mlUbZ6F2VAVV8y83aWNMniNYIeoK5bGYkw8unVxEVEtT65jBUoljdCuXlLZp?=
 =?us-ascii?Q?fpYPnNTWdPWLk+zgR7r0oGcI/pQKdpdReOSGgc6AiWLdakR+icGVWhTbCGqP?=
 =?us-ascii?Q?fSgMQ1afGJVjnB2ReqILPjwVdIwiQR7ltnpus1TJqyQxlC6B+EiOl1hUgg8r?=
 =?us-ascii?Q?dEmRyqYFIqsotAz2mr1EYarH83A5dhQi9YTZRfWIHQamBQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fBad7/24N5szeW/znOdMeQ3t7ztGDw78darhRatsfx88dXNbCxF7IawioLlb?=
 =?us-ascii?Q?ZzXmQRoK/m1PJnwDqPfPaxiCOPz2Mw6VtaXHZdlYEYe1EQzclzcVDn0FybMp?=
 =?us-ascii?Q?Pctbi+2vEjANDR59U+FDGpvSr+XBHp15yDnhWKUCsokvQ/hgre5rk+weBaUy?=
 =?us-ascii?Q?OgDdEtbrFXxQ2qCNZinMO2Q907FauEnntjYOCJewfc65/U3LY+pdAWZv4iLL?=
 =?us-ascii?Q?anGvdBQFCI7qSf/FXPM82F8x675ZmBKgHndclP/2KAdyNZXAFKNCg6wfy9GN?=
 =?us-ascii?Q?Ecm+aH0t5J/nMi9MMJ71Qbm+wmwuf4VK5cFDsH1q9NeYPb2mKalr3BWtouZD?=
 =?us-ascii?Q?h1qV/jHeHNFtfo6SJhgKU+rj+maimwxK+lnrFK+Htiabn+oMgJfGh5vLeycQ?=
 =?us-ascii?Q?yI6Xh0LYXCJlrT/bfbzH2U6pBxjyv+QbmRgGr/ueK96K1mPijwTVXkstx6Bo?=
 =?us-ascii?Q?NPS8w+g7sgZAcGj5qAWP4ETyZmJurfksMoF1WBOQoRqHRpIPW+bkRZ9IubCA?=
 =?us-ascii?Q?Di+59kmAGAxVD97iuPzewPn42TUK3XOvot8cEeTiIE+i0V5shZ7d0XTEAKI1?=
 =?us-ascii?Q?3JIkljuJ/LmH70/MQr94AD1mQu9O8p0eto3ck1agAXLJh/PAZu5aKDTaysJ0?=
 =?us-ascii?Q?ecO2RF+CAX1eHPWiNk+LocBluclRyyLQ7OkHnst/WiPhj7AS1UBYR03uOmMY?=
 =?us-ascii?Q?B7JoABXiwqNBYgAS9a6g/+Ix272syr3g98ean1kiBE2iwlQJ/HD990ORZ0PD?=
 =?us-ascii?Q?q2uQwBqt3dpy+ANkAP47d500qfn+urNkY/JwLHPeENGiptE1DRHW0IolPdi8?=
 =?us-ascii?Q?pKJWAa97I1bxkDxoZUWjYheKRYOfmEX1Bmbt83cjnXacDTFvtkHCXX3F436O?=
 =?us-ascii?Q?/byD1+TkN223e+iTwxNC+QmwImG11l34dMmTOhEB44buLUeBzCTOc36zM2Lu?=
 =?us-ascii?Q?CuxohX0FJsr+1t8kuDltIWHRsyk5Pdy7+MzJz1yroOLyXALqmGfGjxrKevgY?=
 =?us-ascii?Q?nCzim3mSAut3gFgfAEgLHRbx36UKQDsduj65xcCjPb1UBcxElOEGq6eDEhD3?=
 =?us-ascii?Q?WS131EQAUXAASDFLN91phMaLvzt+y94C9Qo2aZMzBh38oC9zq22ckd1Amwm2?=
 =?us-ascii?Q?Cq2Jrz+FUxhWtMSC1LOc28O9oBipY3NLtTBbp1mLG2UpkOIhS9fHNO8MK9qg?=
 =?us-ascii?Q?efCj8axghGU7Bg+OhdED+7cTw3hdlp/f+d/YUfTr4TkIWrD0CuT743X0weL8?=
 =?us-ascii?Q?W4ZlgglqHO0Ii9CYyU76qoMkKhhzeELfSYUThIC+07UELTlwoIbIAuU8txml?=
 =?us-ascii?Q?ubOZBLZ3koa3hVSFR+JFYcSSajH/7BDmPzB6S5MpVOhn7zzuurox9yaKnsCa?=
 =?us-ascii?Q?rOVLG30tkK96CMIUM3WEpYlVOEnFyJrPjB9PJ7tLS9R6ZDevOPrCa2sMFg0w?=
 =?us-ascii?Q?rnJpWmeqRzEMupASTRJAT5lYNG5Wa/wfl3b8zf/Nu5NCbaUrffHAATtg0RxM?=
 =?us-ascii?Q?ticB+yY8zUne3KER+BRdorIhQCDf0UTIbtXStmZpCL/WhsgPETjfWDxTO1G4?=
 =?us-ascii?Q?1CNoWGE9wCrgN1Qc704=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3269617b-6e6d-4d5b-9c37-08dc844d6b47
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 04:18:42.6794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ox47VocKnsT3U29jSWgX6oTBl7QIEk3jOFTuEWlFSFhMQGu1RzYk2DpiRYOKh2mJE/wF3S20hwJspH9YrSwImA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399



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
> > Subject: [EXTERNAL] [PATCH v10 10/13] virtio-net: Add flow filter
> > group, classifier and rule resource objects
> >
> .
> .
> > +Note that at most one action is ever taken for a given packet. If a
> > rule is
> > +applied and an action is taken, the action of other rules is not taken=
.
> > +
> we might have multiple actions per rule in future. For ex RX VQ and TC ma=
rk
> etc.
Yes. a multi_action_rule as new object or extension to struct virtio_net_re=
source_obj_ff_rule as follow on this.
