Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A1279C2
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 06:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718086208; cv=fail; b=U+9EZXPEpWA6X1SANtMPtEtKElYOhnozd5penpILlIXjj3vyxvrM1EtQoH2xkGnJAUeggsnqHWb1XQkslXgxKjjnAEkgNl1ZQ3E3MpZkFeiRZ5Q8x2UYarFRnb4okRxsJNy6l2VKRcRc2oDsed4nMHDweFYBVu1AnUquwN4baO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718086208; c=relaxed/simple;
	bh=cuhH/tIBJWrD8aW9J95/wVSfdpGHCr5wMzH8StqiwsQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C8SeexXlSRt3nbugZzUJ3ns8MdR7nEraT1pN43BlRyYHsPdzhpkXVt1JY/j6skXLQSGnNam6EITZ7XUyHsLwYAPwdecoUvmyJPw0iQzD3j9opy6OSApf9Ig51OgG72BH71SLymNppuArfyF+42BKuqqsXl+K+29Idp41FgK7dYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r8RdHYuw; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r8RdHYuw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naDy1g7y0kRXHlF0RICIuohWih0MqOmP4+ZTL8AwTLej8FolnPxtGWyyQv0+xv4WLpxyTRHn1yPVqzIip+YkZqd6ze8riX0VDs96vyekQ/eocvCLd1lmB7d7QHuYE92BcSN8y6rTl8AE+oDH4JBGAOsk649NeK1FtmMkZ2GFcfVDUFnsVQMjSB1h3kBsqfOD6SRCm1MaOUinys2eGu+2dMqMEmECXJKqxNJxZDrr4E1bypJIRHW+GZPKnAwPNVX+bRn24Djeg4GIbTDr4HYM3DQpjZ1CtBG34U+610qJQQs3lUFXDVKUsImS2JzQC6jtJFFPF6daRFV6jzF4Zbiybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuhH/tIBJWrD8aW9J95/wVSfdpGHCr5wMzH8StqiwsQ=;
 b=lj2VbMgryDwZiHQqk8Z04XVZPQRp02gSdeCEBmU4he0NmPeoEfTn0+pf2krnk9xFVP5Itt03hRtR79NsD0C9Ql41QsV989QwV0JPU+SxGdc80xyLr+hRmqfuD7a57oVPdgL1X15T4nTEOQ5TLusWZ28ThtW9SY33pu2SW7WV91uXi7LrPJ+GzUgOd5++4hTgcn5pnOLc7m1iIQGdBbkjZqYFH3Psm23N3xJiouF5P3mdYyL0Dl5lHNlnHkE2LkU9Ni4G9HIV9m4311FOoykPjWabxTe+UF28I2SNQY0MXWxTT2bdWHQerwPgMFJmlwG3XsywhjRIFQwjVmhcPqnwgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuhH/tIBJWrD8aW9J95/wVSfdpGHCr5wMzH8StqiwsQ=;
 b=r8RdHYuw7md0o+tN13JPj66YveLAE8yz4hlL7xgouMcFUf129Uw+hnTI6Ms7x6OQh5SQFAB8RP/cfXzb+5ptJqswwpz9x/nKe2g3sIzdTSgN6wmuRZMmCFpAn2NR0PH9KAb5h30AnsDF8F06xv3YnzUtVXGa8pHmIKXRwBgInGTrz+umsDbsffLx1vkRRbZesI2HQiUSzNM5LZLPn9ZLfzB7Ph8FL07AlHRAVkhUx8+lo/2gvJhUV4X+y6K0EGgI36ZpnjNpaHGJdMYLNxZU57B/ZNCQEXB3GhT67KeQ4jzDOKEbzEoqy/l/bj052dY+YQ+KycdJUpFJy5TCLGk8hQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by IA1PR12MB7733.namprd12.prod.outlook.com (2603:10b6:208:423::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 06:10:02 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 06:10:02 +0000
From: Parav Pandit <parav@nvidia.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: Vincent Guittot <vincent.guittot@linaro.org>, =?utf-8?B?QWxleCBCZW5uw6ll?=
	<alex.bennee@linaro.org>, "stratos-dev@op-lists.linaro.org"
	<stratos-dev@op-lists.linaro.org>, Manos Pitsidianakis
	<manos.pitsidianakis@linaro.org>, Cornelia Huck <cohuck@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH V5] virtio-transport: Clarify requirements
Thread-Topic: [PATCH V5] virtio-transport: Clarify requirements
Thread-Index: AQHau8GUIND+r1IV+UyIhrsUeJlUDrHCENgw
Date: Tue, 11 Jun 2024 06:10:02 +0000
Message-ID:
 <PH0PR12MB5481413D59F2DC236F0B59DFDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <9d543789de03d26a27a43ae8f7621d07d66e8731.1718084050.git.viresh.kumar@linaro.org>
In-Reply-To:
 <9d543789de03d26a27a43ae8f7621d07d66e8731.1718084050.git.viresh.kumar@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB7733:EE_
x-ms-office365-filtering-correlation-id: 71af38cf-3f31-4d16-2341-08dc89dd2189
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?NGRjeHA1M2hwWUhEWTVBc3llL0loeVN6OWRaQ3JMbTgwbTdDRUNBZXgzd0lk?=
 =?utf-8?B?VzI3MlhCclhWdkErSDJvZ1NyeVc0L0Zkc0lSQWNvemdZOUNjbWdPTkNXNkMz?=
 =?utf-8?B?RGVnT2UwbGxYMjVoY1o2dDhRNnpiaGQzRUpaMEtVcDUxblJ1aGw5L0NJRlBx?=
 =?utf-8?B?OUwxM3hUdU9qNkUydEtoanBVK0xUUERLTTNPSDUwdVNxeFRoeFRxcm02bjl6?=
 =?utf-8?B?NVBUUE5yalFPOUE4YTNIZjBEeVR6VDRmbytueS8yMUxnREl0U3JjcUJnajlJ?=
 =?utf-8?B?RGlzdTlFMTNzWlk2WHgvYW5qWkRwdDN3bmVNMTdZU0toSkVzWXFpL3FJWkNW?=
 =?utf-8?B?ajhtOVZma0dhV291ZTBVbXVZZWhwT1gzazlnUlZiNmFRQ3VON0FZV2J1QjFD?=
 =?utf-8?B?NmNrcWdrTURBNDZTZERwV09iY2tOV2liTmJRSGJMcHNtcG0zb0VvSUw1NUFK?=
 =?utf-8?B?MC9iWEZWSzNsUjNKN0RUZ3RUMnp5anlPamlFanRDOEY2N0VWdFEyaXg1UU1k?=
 =?utf-8?B?d3BweUJvNFZDaG5CZDFtdDJoVy91RWkzeDlzdTNsSVJnVGRYeDZOTkhlQjJo?=
 =?utf-8?B?dEVxYXRsTDNtM3JTV3J6RFJNYVNoQ2drY0NZV01POXQ3YkMxRXZIanlqaGg0?=
 =?utf-8?B?NmFseG9LWW53Q0ZETGtmdEJWa0krVG9kdUxya21nWTM3clIwK2hLUkFEbStj?=
 =?utf-8?B?QktZR25yeUV5NzQ3eU1QTVFpY2JTSjdkdVI4VnpNTHVxcnNaNXUzYjhSWXpD?=
 =?utf-8?B?RGJPRzFmUW5halk3TURsSVRxZWZ4VjlVeGlnR0hPN1NESGtRVTkrbW5XQlNO?=
 =?utf-8?B?UVM2a0xlbFdXT0xQRzdZbFlxYXc3MWJybTJhcmlibWk0bXJvWmZzNzFxbDg1?=
 =?utf-8?B?SHMrc3RON0ttVWpYenkvNlBkUlhUK2szVzRXV0JFR3FaZ2ZheGJVWE1FZUR2?=
 =?utf-8?B?N1Y3SnRFd2ZCWSt6c2xkZlZCV3JYcytHSEJhUSszMHBtclozU09meXBia3d1?=
 =?utf-8?B?dUZJV2NQWVp5UkM4RTd5RE9SUm1TNGdJNlcya1BiWEVMWDFnYkxEc2FnSDZI?=
 =?utf-8?B?dUJ4eWUvWm50MzVoK05nWXBPZndFeGxLQWZoMEFlY05LN3VoOFJPcnRFSFgz?=
 =?utf-8?B?bHlQOU5nMWRTUG1nY1Zxb2VhR3ArWk5uREJzbzBWM0hIam5YNjJWUzJocWI4?=
 =?utf-8?B?T2d1bGtYTnVkM2dUd3grQmp6NE5EUzN6c1VCUXFKZFdtbnYzdlZQc0luQVQy?=
 =?utf-8?B?WkU1TFRnRUhTeXB3Tm9hMkxhS2FKWHdRclZDU2xqdis2b3l1VWNJZXQ5Nm9j?=
 =?utf-8?B?cHo0MFFNOUFlaVdCVFhGS0JPSHpZVks3UmNteXZneW83ZzVodG1OYzd6VUNB?=
 =?utf-8?B?MzUyVng2VVhRUWV4SGxIckUxYUlsSnA3ZUh4QW9vT0ZJdmRpL1RrZnlrYUlO?=
 =?utf-8?B?aUlEaWNuMVhQTDA5c2ZBMERHQ256QUVkUlNROXBzekZzSFdYVm9KWXdHVXR6?=
 =?utf-8?B?SVdOeGtJZU1qM2czb3U4WHIzQ2xzQkYwOW5PTEdsWFRkSTMxMzI3NGE4TUc3?=
 =?utf-8?B?TDNkUUJ5MTV2czFPK094c2cyYUxESjVlTlUwRDdZeVdXSlp4cU8rT2xwc0p4?=
 =?utf-8?B?R255K2cwY1ZPWmJEYVpOalBzM1FvTXZBd1hiRCtnTG1ibzVMVnZrb3E3Qkhj?=
 =?utf-8?B?ejBudWp6dk5lcXRSVTJlVHNRakpIV0RQQjZTOGRlbEVicnd3NVpQamhTQS9x?=
 =?utf-8?B?Nk1VdTZvSmpndmY4TzlUNmxMK1V4ZFJZOHUvRnZCcVJwY1VqcU1ydnpjeHg2?=
 =?utf-8?Q?GI13U+ZEnUvpwSPyIJj05whEiAMsAs5cioSjw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1JzbE1xVGd1dzVJRmY2YlIveGY3N0xTUmVxRFlENU1BWCtaazBBYW1xSmxu?=
 =?utf-8?B?cGt5Rk1oemQzOTBFenI1UTYxMXFVQ3FMbXB1NWh0NUxBTWVrVDhhazRUelU3?=
 =?utf-8?B?MTlZMkVWbE80a0VTWU40RllkWGdjWVFtSTQ0MHhsa0JLU0VzNEhUaVQ0OTR3?=
 =?utf-8?B?NzBHZmdkZTVOL3VaMFUvTks4ZWtta1R0bmxkdHlWc1EzSUpId1RMd0ZHMkd5?=
 =?utf-8?B?ZjQyUkxUT0FEM0F4eGQ3VVRiaWdKTVErdlpubFdvSEhsYWhXbzZvQUtsMVB5?=
 =?utf-8?B?TUVzRnJydGdzT29ldi9DL1lyaVpsWHJ4L3o4K2d6MUx6anZ0Z0JINjI5SUFU?=
 =?utf-8?B?czZNQ3hkN2ZXUk52TitYOXg1cjloVjFJOEs4ZTVQZmxzWWhoNEUzZHp6SjhE?=
 =?utf-8?B?TllZbGhvZ01KUTBFRWxYOU9HdmJ2SkMxR1VEMlBKNmNSbUQrUlJ4SXlDczU5?=
 =?utf-8?B?ZXRqUzVRNlFud0ovRHh3SmZJMm1SVThDb2NGSTFWSXI4SkZBblNwaUJOQTlB?=
 =?utf-8?B?UlRYRDZZNDk3UGdSQzZadzFXcGplNGJRcjVrQlpvWEtmVTFhL1p2d0lFOGhL?=
 =?utf-8?B?bmVsZHM5R0NZTHAybDJMdzhIMkphQURkcFZHMGRXejd2RktZK2VFR3NjdXdj?=
 =?utf-8?B?TTRiaDVWdnBGK0tIS09oREVSSTV4OFNwOXpFa043REpMbEcyZWJUTDZoMHdV?=
 =?utf-8?B?SmhUajhPWnBSMk5QeXVldTZyc2o4Mm1jYnhrNUVZWEpVSjRqL3Q5cEVabFhJ?=
 =?utf-8?B?Ym90RDBPM1RuNDk5Kzd2eUFXSXg4R0tqM0tWZTEyS1hMZmtxR1Jrd0hGMFhD?=
 =?utf-8?B?eGNCUjFwNVNqcThKakZ2QkRMcHU5Y0xVc0JtSUlDY0crWld4RlRvWi9wbTJk?=
 =?utf-8?B?SFRtSlQyQ3RjREoxeXRTcFdDaTZTVlRHK1BHSzZpYWd4ZUJTVXZQc1BPZ3o1?=
 =?utf-8?B?NjVFckpWQ1JocEViUGs1QmY3RW9vRG5Sa01Pd2FwN3M1akcxanpsdlBzVVBV?=
 =?utf-8?B?WGFFZ2I4Ti9ESGxvMURsYy9VaW5qRHJMeVluSTRqK2g2Ylk1WDVORzMxWThY?=
 =?utf-8?B?VnFvWHNuWGdXd3RnaE02T2dCTWwxOElNM3l3cXJTVXZKRWZjWHhHTlF3cnky?=
 =?utf-8?B?NnlXb293U2J0b2lucUhpdXAxdU1IZnViVzFrK21DVjNWSk0reEJLWTNidGFR?=
 =?utf-8?B?UEZTMG9sNThYUUdLa2ZJTmNBOEpyVHdMeW5CUmI5MElKZUxyK21ybTl4R1Qy?=
 =?utf-8?B?QXFyWFlNZFVocmNPSXZ6VGV3UTQxMlRwTGRld3JjUWxrRzMyL2lDK01uZ1B5?=
 =?utf-8?B?Z2tDMWU3UHNvaVBnVW1ad05ORDRPTUtnUWRjcVdXRHVPTVRERlh3dFZXT0ht?=
 =?utf-8?B?c1JCQTQ3ak1qYUdyY1hvSkdsb2xVeWpWampLTHdpSVNXRWlnNlNMWWVmSXZr?=
 =?utf-8?B?Q2szOVBHeVFmdFBjUW1nVzNBTkl5UzVaUFE0RGtZenNjWnZBcUNraVNoUVhQ?=
 =?utf-8?B?bGZvdG5IbWNiWFRVVU9RN0loVmZTdXFOLzRQSzFzSXFwM3l6dnZMZU9ZM0lG?=
 =?utf-8?B?Y1RGRWxZdzNud002NlArR285MWoyaGlxK2JldEhzYmc0VWs2UEtWN0J4cjht?=
 =?utf-8?B?TFByeXVleVZzNFFMUjBvbzROOWVzamdSNjExcGtLcXRKTUc0MXJxeUhIMXRM?=
 =?utf-8?B?ZFM5Rmg1WTNQV1RIclVlazZ5VGpZUlRhTkVkSENleDNkVkQrNW9rdUVzUmRP?=
 =?utf-8?B?VFFhUzlJcUhFSUVTNWRuaWFGUGhLSkxyRXVjMWEzcUxNWUQraUJBVHhVNDBF?=
 =?utf-8?B?WkcyRnVHOGphbHVGdEdxUXNxd05uZHZyWEJHMTJFZVdFOVFHdElGSlg5NWQr?=
 =?utf-8?B?KytCL3JrYnlmeFhpQk9Va1pBd2xZREdXYVhvdUkrNkZCdDNHTE1IT0VpMGln?=
 =?utf-8?B?OU9SN3I3TGJvYktock5pTDlIZWZYcE51UnR2Y25wN0puN2NWZU5Xb2hMR1FS?=
 =?utf-8?B?MDJ6a3VnVjdRVWtaZDg3bGNoaXlNT0NOTmV3RkFhZlFtcFB5RVg1NzVyNWFu?=
 =?utf-8?B?WXQyZlBOOHdFaEx2SUZCS0lsMi9UTVlYL1ZjcFcrOVJWeXUrQ2tNWW1MVEtO?=
 =?utf-8?Q?eXT8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71af38cf-3f31-4d16-2341-08dc89dd2189
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 06:10:02.3025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MjV1lZ8MukmBrrk+E0oP3bE20Gkfnvq2APf256bRcfd08SZUGX6ScnD+fm1liq8L0UwciulWz40o11DMfasw7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7733

SGkgVmlyZXNoLA0KDQo+IEZyb206IFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5v
cmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTEsIDIwMjQgMTE6MDYgQU0NCg0KWy4uXQ0KPiBk
aWZmIC0tZ2l0IGEvY29udGVudC50ZXggYi9jb250ZW50LnRleA0KPiBpbmRleCAwYTYyZGNlNWY2
NWYuLmUyYTgzNjMyNzgxOCAxMDA2NDQNCj4gLS0tIGEvY29udGVudC50ZXgNCj4gKysrIGIvY29u
dGVudC50ZXgNCj4gQEAgLTYzMSw4ICs2MzEsODYgQEAgXHNlY3Rpb257RGV2aWNlIENsZWFudXB9
XGxhYmVse3NlYzpHZW5lcmFsDQo+IEluaXRpYWxpemF0aW9uIEFuZCBEZXZpY2UgT3BlcmF0aW9u
IC8NCj4gDQo+ICBcY2hhcHRlcntWaXJ0aW8gVHJhbnNwb3J0IE9wdGlvbnN9XGxhYmVse3NlYzpW
aXJ0aW8gVHJhbnNwb3J0IE9wdGlvbnN9DQo+IA0KPiAtVmlydGlvIGNhbiB1c2UgdmFyaW91cyBk
aWZmZXJlbnQgYnVzZXMsIHRodXMgdGhlIHN0YW5kYXJkIGlzIHNwbGl0IC1pbnRvIHZpcnRpbw0K
PiBnZW5lcmFsIGFuZCBidXMtc3BlY2lmaWMgc2VjdGlvbnMuDQo+ICtEZXZpY2VzIGFuZCBkcml2
ZXJzIGNhbiB1c2UgZGlmZmVyZW50IHRyYW5zcG9ydCBtZXRob2RzIHRvIGVuYWJsZQ0KPiAraW50
ZXJhY3Rpb24sIGZvciBleGFtcGxlIFBDSSwgTU1JTywgb3IgQ2hhbm5lbCBJL08uIFRoZSB0cmFu
c3BvcnQNCj4gK21ldGhvZHMgZGVmaW5lIHZhcmlvdXMgYXNwZWN0cyBvZiB0aGUgY29tbXVuaWNh
dGlvbiBiZXR3ZWVuIHRoZSBkZXZpY2UNCj4gK2FuZCB0aGUgZHJpdmVyLCBsaWtlIGRldmljZSBk
aXNjb3ZlcnksIGV4Y2hhbmdpbmcgY2FwYWJpbGl0aWVzLA0KPiAraW50ZXJydXB0IGhhbmRsaW5n
LCBkYXRhIHRyYW5zZmVyLCBldGMuIEZvciBleGFtcGxlLCBpbiBhIGhvc3QvZ3Vlc3QNCj4gK2Fy
Y2hpdGVjdHVyZSwgdGhlIGhvc3QgbWlnaHQgZXhwb3NlIGEgZGV2aWNlIHRvIHRoZSBndWVzdCBv
biBhIFBDSSBidXMsDQo+ICthbmQgdGhlIGd1ZXN0IHdpbGwgdXNlIGEgUENJLXNwZWNpZmljIGRy
aXZlciB0byBpbnRlcmFjdCB3aXRoIGl0Lg0KPiArDQo+ICtUaGUgc3RhbmRhcmQgY29udGFpbnMg
c2VjdGlvbnMgZGVzY3JpYmluZyB0aGUgdHJhbnNwb3J0LWFnbm9zdGljIHBhcnRzDQo+ICtvZiB2
aXJ0aW8sIGFuZCBzZWN0aW9ucyBkZXNjcmliaW5nIGhvdyBpbmRpdmlkdWFsIHRyYW5zcG9ydHMg
aW1wbGVtZW50DQo+ICt2aXJ0aW8uDQo+ICsNCj4gK1xzZWN0aW9ue1ZpcnRpbyBUcmFuc3BvcnQg
UmVxdWlyZW1lbnRzfVxsYWJlbHtzZWM6VmlydGlvIFRyYW5zcG9ydA0KPiArT3B0aW9ucyAvIFZp
cnRpbyBUcmFuc3BvcnQgUmVxdWlyZW1lbnRzfQ0KPiArDQo+ICtUaGVyZSBhcmUgc29tZSBtZWNo
YW5pc21zIHRoYXQgYW55IHRyYW5zcG9ydCBpcyByZXF1aXJlZCB0byBpbXBsZW1lbnQsDQo+ICth
bmQgc29tZSByZXF1aXJlbWVudHMgdGhhdCBkZXZpY2VzIGFuZCBkcml2ZXJzIGFyZSByZXF1aXJl
ZCB0byBmb2xsb3cuDQo+ICsNCj4gK1xzdWJzZWN0aW9ue1RyYW5zcG9ydCBSZXF1aXJlbWVudHN9
XGxhYmVse3NlYzpWaXJ0aW8gVHJhbnNwb3J0IE9wdGlvbnMNCj4gKy8gVmlydGlvIFRyYW5zcG9y
dCBSZXF1aXJlbWVudHMgLyBUcmFuc3BvcnQgUmVxdWlyZW1lbnRzfQ0KPiArDQo+ICtBIHRyYW5z
cG9ydCBwcm92aWRlcyBhIG1lY2hhbmlzbSBmb3IgdGhlIGRyaXZlciB0byBkaXNjb3ZlciB0aGUg
ZGV2aWNlLg0KPiArDQpJIHdvdWxkIGxpa2UgdG8gYWRkIGEgbm9ybWF0aXZlLg0KDQpBIHRyYW5z
cG9ydCBNQVkgcHJvdmlkZSBhIG1lY2hhbmlzbSB0byBjcmVhdGUgYW5kIGRlc3Ryb3kgdmlydGlv
IGRldmljZXMuDQoNCihmb3IgZXhhbXBsZSBQQ0kgdHJhbnNwb3J0IHByb3ZpZGVzIHRoaXMpLg0K
DQpJdCBpc27igJl0IGJsb2NrZXIgZm9yIHRoaXMgcGF0Y2guDQpJbiBjYXNlIGlmIHlvdSBzcGlu
IHY2LCBwbGVhc2UgYWRkLCBlbHNlIHdpbGwgc2VuZCB0aGlzIGNoYW5nZSBhZnRlciB5b3VycyBp
cyBtZXJnZWQuDQoNCj4gK0EgdHJhbnNwb3J0IHByb3ZpZGVzIGEgbWVjaGFuaXNtIGZvciB0aGUg
ZHJpdmVyIHRvIGlkZW50aWZ5IHRoZSBkZXZpY2UNCj4gK3R5cGUuDQo+ICsNCj4gK0EgdHJhbnNw
b3J0IHByb3ZpZGVzIGEgbWVjaGFuaXNtIGZvciBjb21tdW5pY2F0aW5nIHZpcnRxdWV1ZQ0KPiAr
Y29uZmlndXJhdGlvbnMgYmV0d2VlbiB0aGUgZGV2aWNlIGFuZCB0aGUgZHJpdmVyLg0KPiArDQo+
ICtBIHRyYW5zcG9ydCBhbGxvd3MgbXVsdGlwbGUgdmlydHF1ZXVlcyBwZXIgZGV2aWNlLiBUaGUg
bnVtYmVyIG9mDQo+ICt2aXJ0cXVldWVzIGZvciBhIHBhaXIgb2YgZGV2aWNlLWRyaXZlciBhcmUg
Z292ZXJuZWQgYnkgdGhlIGluZGl2aWR1YWwNCj4gK2RldmljZSBwcm90b2NvbC4NCj4gKw0KPiAr
QSB0cmFuc3BvcnQgcHJvdmlkZXMgYSBtZWNoYW5pc20gdGhhdCB0aGUgZGV2aWNlIGFuZCB0aGUg
ZHJpdmVyIHVzZSB0bw0KPiArYWNjZXNzIG1lbW9yeSBmb3IgaW1wbGVtZW50aW5nIHZpcnRxdWV1
ZXMuDQo+ICsNCj4gK0EgdHJhbnNwb3J0IHByb3ZpZGVzIGEgbWVjaGFuaXNtIGZvciB0aGUgZGV2
aWNlIHRvIG5vdGlmeSB0aGUgZHJpdmVyDQo+ICthbmQgYSBtZWNoYW5pc20gZm9yIHRoZSBkcml2
ZXIgdG8gbm90aWZ5IHRoZSBkZXZpY2UsIGZvciBleGFtcGxlDQo+ICtyZWdhcmRpbmcgYXZhaWxh
YmlsaXR5IG9mIGEgYnVmZmVyIG9uIHRoZSB2aXJ0cXVldWUuDQo+ICsNCj4gK0EgdHJhbnNwb3J0
IHByb3ZpZGVzIGEgbWVjaGFuaXNtIGZvciB0aGUgZHJpdmVyIHRvIGluaXRpYXRlIGEgcmVzZXQg
b2YNCj4gK3RoZSB2aXJ0cXVldWVzIGFuZCBkZXZpY2UuDQo+ICsNCg0KPiArQSB0cmFuc3BvcnQg
cHJvdmlkZXMgYSBtZWNoYW5pc20gZm9yIHRoZSBkcml2ZXIgdG8gcmVhZCB0aGUgZGV2aWNlDQo+
ICtzdGF0dXMuIEEgdHJhbnNwb3J0IHByb3ZpZGVzIGEgbWVjaGFuaXNtIGZvciB0aGUgZHJpdmVy
IHRvIGNoYW5nZSB0aGUNCj4gK2RldmljZSBzdGF0dXMuDQo+ICsNCj4gK0EgdHJhbnNwb3J0IHBy
b3ZpZGVzIGEgbWVjaGFuaXNtIHRvIGltcGxlbWVudCBjb25maWd1cmF0aW9uIHNwYWNlDQo+ICti
ZXR3ZWVuIHRoZSBkZXZpY2UgYW5kIHRoZSBkcml2ZXIuDQo+ICsNCj4gK1xzdWJzZWN0aW9ue0Rl
dmljZSBSZXF1aXJlbWVudHN9XGxhYmVse3NlYzpWaXJ0aW8gVHJhbnNwb3J0IE9wdGlvbnMgLw0K
PiArVmlydGlvIFRyYW5zcG9ydCBSZXF1aXJlbWVudHMgLyBEZXZpY2UgUmVxdWlyZW1lbnRzfQ0K
PiArDQo+ICtUaGUgZGV2aWNlIGtlZXBzIGFueSBkYXRhIGFzc29jaWF0ZWQgd2l0aCBhIGRldmlj
ZS1pbml0aWF0ZWQNCj4gK3RyYW5zYWN0aW9uIGFjY2Vzc2libGUgdG8gdGhlIGRyaXZlciB1bnRp
bCB0aGUgZHJpdmVyIGFja25vd2xlZGdlcyB0aGUNCj4gK3RyYW5zYWN0aW9uIHRvIGJlIGNvbXBs
ZXRlLg0KPiArDQo+ICtUaGUgZGV2aWNlIGRvZXNuJ3QgYWNjZXNzIHRoZSBjb250ZW50cyBvZiBh
IHZpcnRxdWV1ZSBiZWZvcmUgdGhlIGRyaXZlcg0KPiArbm90aWZpZXMsIGluIGEgdHJhbnNwb3J0
IGRlZmluZWQgd2F5LCB0aGUgZGV2aWNlIHRoYXQgdGhlIHZpcnRxdWV1ZSBpcw0KPiArcmVhZHkg
dG8gYmUgYWNjZXNzZWQuDQo+ICsNCj4gK1RoZSBkZXZpY2UgZG9lc24ndCBhY2Nlc3Mgb3IgbW9k
aWZ5IGJ1ZmZlcnMgb24gYSB2aXJ0cXVldWUgYWZ0ZXIgaXQgaGFzDQo+ICtub3RpZmllZCB0aGUg
ZHJpdmVyIGFib3V0IHRoZWlyIGF2YWlsYWJpbGl0eS4NCj4gKw0KVGhpcyBuZWVkcyB0byBiZSBj
b3JyZWN0ZWQgdG8gb25seSBzYXkgIm1vZGlmeSIuDQoNCkEgZGV2aWNlIG1heSBzdGlsbCBhY2Nl
c3MgKHJlYWQpIHdoYXQgaXMgYWxyZWFkeSB3cm90ZSwgZm9yIGV4YW1wbGUsIHVzZWQgaW5kZXgg
b2YgdGhlIHNwbGl0IHF1ZXVlLg0KT3IgcGFja2VkIHF1ZXVlIGZsYWdzLg0KDQo+ICtUaGUgZGV2
aWNlIHJlc2V0cyBpdHNlbGYgYW5kIHRoZSB2aXJ0cXVldWVzIGlmIHJlcXVlc3RlZCBieSB0aGUg
ZHJpdmVyLA0KPiAraW4gYSB0cmFuc3BvcnQgZGVmaW5lZCB3YXksIGlmIHRoZSB0cmFuc3BvcnQg
cHJvdmlkZXMgc3VjaCBhIG1ldGhvZC4NCj4gKw0KPiArXHN1YnNlY3Rpb257RHJpdmVyIFJlcXVp
cmVtZW50c31cbGFiZWx7c2VjOlZpcnRpbyBUcmFuc3BvcnQgT3B0aW9ucyAvDQo+ICtWaXJ0aW8g
VHJhbnNwb3J0IFJlcXVpcmVtZW50cyAvIERyaXZlciBSZXF1aXJlbWVudHN9DQo+ICsNCj4gK1Ro
ZSBkcml2ZXIgYWNrbm93bGVkZ2VzIGRldmljZSBub3RpZmljYXRpb25zLCBhcyBtYW5kYXRlZCBi
eSB0aGUNCj4gK3RyYW5zcG9ydC4NCj4gKw0KPiArVGhlIGRyaXZlciBkb2Vzbid0IGFjY2VzcyB2
aXJ0cXVldWUgY29udGVudHMgYmVmb3JlIHRoZSBkZXZpY2Ugbm90aWZpZXMNCj4gK2Fib3V0IHRo
ZSByZWFkaW5lc3Mgb2YgdGhlIHNhbWUuDQo+ICsNClRoaXMgYWxzbyBuZWVkcyBmaXguDQpBIGRy
aXZlciBtYXkgYWNjZXNzIChwb2xsKSBmb3IgdGhlIHBhY2tlZCBxdWV1ZSBmbGFncyBvciB1c2Vk
IGluZGV4IG9mIHRoZSBzcGxpdCBxIHdpdGhvdXQgZGV2aWNlIG5vdGlmeWluZyBpdC4NCg0KPiAr
VGhlIGRyaXZlciBhY2Nlc3NlcyBxdWV1ZWQgYnVmZmVycyBhZnRlciB0aGUgZGV2aWNlIGhhcyBw
cm9jZXNzZWQgdGhlbQ0KPiArYW5kIG5vdGlmaWVkIHRoZSBkcml2ZXIgb2YgdGhlaXIgYXZhaWxh
YmlsaXR5LiBUaGlzIG1lY2hhbmlzbSBpcw0KPiArdHJhbnNwb3J0IGRlZmluZWQuDQo+ICsNCj4g
K1RoZSBkcml2ZXIgYXNrcyB0aGUgZGV2aWNlIHRvIHJlc2V0IGl0c2VsZiBhbmQgdGhlIHZpcnRx
dWV1ZXMgaWYsIGZvcg0KPiArZXhhbXBsZSwgdGhlIGRyaXZlciB0aW1lcyBvdXQgd2FpdGluZyBm
b3IgYSBub3RpZmljYXRpb24gZnJvbSB0aGUNCj4gK2RldmljZSBmb3IgYSBwcmV2aW91c2x5IHF1
ZXVlZCByZXF1ZXN0Lg0KPiArDQpQbGVhc2UgcmVtb3ZlICJ2aXJ0cXVldWUiIGZyb20gYWJvdmUu
IFRoZSAiZGV2aWNlIHRvIHJlc2V0IGl0c2VsZiIgaXMgZW5vdWdoLg0KImFuZCB0aGUgdmlydHF1
ZXVlcyIgaXMgY29uZnVzaW5nLCBpdCBzb3J0IG9mIGltcGxpZXMgdGhlIHZxcyBhcmUgc29tZXRo
aW5nIHNlcGFyYXRlIGZyb20gdGhlIGRldmljZSByZXNldCBmbG93LCB3aGljaCBpcyBub3QgdHJ1
ZS4NClNvIGRldmljZSByZXNldCBpcyBnb29kIGVub3VnaC4NCg0KPiANCj4gIFxpbnB1dHt0cmFu
c3BvcnQtcGNpLnRleH0NCj4gIFxpbnB1dHt0cmFuc3BvcnQtbW1pby50ZXh9DQo+IC0tDQo+IDIu
MzEuMS4yNzIuZzg5YjQzZjgwYTUxNA0KPiANCg0K
