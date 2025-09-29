Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011057.outbound.protection.outlook.com [52.101.62.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353453081CF
	for <virtio-comment@lists.linux.dev>; Mon, 29 Sep 2025 16:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759164694; cv=fail; b=KdVuLdiDhNcsm22GylAHRTioeXJ4l3AOAcTOxRLE7u5QD9LErGNTDHRixbAx+RKjdhxwFJvUT+yCfC9aTr+MSPn0jYG4pztf8jeh8zV2BKP5K68Vxyv9lvaipTE+B3gH9aksa994mdazcrCRBiCLP+PyFYqnl7FEnzek5CN1pc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759164694; c=relaxed/simple;
	bh=joeYTIxd1tw1T2JMY86O0YzFKqQJH+k7MD/AlCgnbDQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EvnRrk5M4EexNQNU706WqlbosNuTM8yHbRS820N4LV5de1ymOOeKj5juTz6UEp4+hOvEB3UMoV6HBrmcabhVsk7JoWTqZ2WfZzaTjyl0b/B8RMf+9Lg1/4gNdMeGkNwnK3aTt3pMnFa9/tzB2eUW5nF2iR/wRNDNeRIEUlGceos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ncc2xpFt; arc=fail smtp.client-ip=52.101.62.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ncc2xpFt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/o3Q8O2BKHu9c/Qi0rrVEEab1Lz3LPLMhCJEpaoflKFO7elxXNOmUCn7e1Dvmc7+70amYq8mnaCZBfw0gBHuAm8u0NxQBpktegs8T8Pj+f2AoQUWXza04yGM6rwcjrOkN2XWUt3wka8GCENAo1L8lJP+rjTgGaXA8/lZjawwX93AZ5j0lgYMYFsUYOgkjXOIlFHQ9QXWgzq21sJjbUoptLGvaJrsOuhG13wt3zWnfYBewVukErY6GjCYwFymh3BvhAhmEmw3wHjjV1D6TgLotMz+5OUIx6RTj0mG6zZaks8md0+Qv2a+15yaE/z6FSC1yM7TjYc0M0a3o438dT5CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joeYTIxd1tw1T2JMY86O0YzFKqQJH+k7MD/AlCgnbDQ=;
 b=Qd5QoqlbNvTNUXr55foP51VoDGZJ/bFmrsz20yCKiaJ9W/ZLh0nmuKvIUFtp4q+/GzPz2oGT+g646H8NYPJki9NhenBbAV8xLh3vZWESW0qZ62E2qy/Ei6yFyjhEO0VX9AR39ingVrUxFY5KAoUuTvpOeFM9rhOXBsYqqAp77ASCh9AqIsQhauzkbMVMG7fLRZtNwroDdr/Dfb0GAsSrawhlqtP6hOL9zWo1E0BOZmWYSPmOnVB/Rp2kbBcbg93wJAoqDhkkWSj6N7gS2QwpP7e0xzeF4JKb4/9OUNGGsv/aUCY8qRMYZX4OCCSvKlyotGJYtcDy9TBov5ABmXxt1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joeYTIxd1tw1T2JMY86O0YzFKqQJH+k7MD/AlCgnbDQ=;
 b=Ncc2xpFt1+hCruN93W2TuAYI248kR48FxMxX8TVshwObAbTstIQ4eMQqP+DybbErGO3mPElm3vIInuecJtY4Fm+GUo5Cygbz8p3XW3Z9jDo6UyqjeDGhhp6DoCP/n6Z/jp+wAE9iWvoS4VuTCgp+d1fmqz0WLzNEmJyazYXd1TdEogGFZnSlLObtNTVpx8EXdpXEfE6FclysdhVtTByAF5gZ6u6pn+5dCZ0SGMLSKZ5JRnsk9xOM+sjorrgR8fSl0/6wjjv5kk+2P7tWqa6uoLOHRv0dEKfW2im/6d178ThDQUEEO5oNi4yWcjOT76zIOK1QHtcApoCM5RNp8WQ9PQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by LV5PR12MB9801.namprd12.prod.outlook.com (2603:10b6:408:2fc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 16:51:30 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 16:51:30 +0000
From: Parav Pandit <parav@nvidia.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: Michael S.Tsirkin <mst@redhat.com>, Cornelia Huck
	<cornelia.huck@redhat.com>, Bill Mills <bill.mills@linaro.org>
Subject: RE: Use of LaTeX for the specification
Thread-Topic: Use of LaTeX for the specification
Thread-Index: AQHcMU8/PaN6MPiqRECHTLneMDMBaLSqX6DA
Date: Mon, 29 Sep 2025 16:51:29 +0000
Message-ID:
 <CY8PR12MB719523C466209B552DE30000DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <87ms6dl3sh.fsf@draig.linaro.org>
In-Reply-To: <87ms6dl3sh.fsf@draig.linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|LV5PR12MB9801:EE_
x-ms-office365-filtering-correlation-id: fda443d5-f5e9-4e2b-9eeb-08ddff787035
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?akNvTy9pbzh4NjdhcEdXZEdqU2dVeHlUUU44SHpEaEIxUktPYVF5VUpCSDJV?=
 =?utf-8?B?VE5EVlVjTkVjS0VXNkxpR21wekVZUzE4ZTB4NTlkdkExc0J4eDhQdC9rckJl?=
 =?utf-8?B?bkVXeDZKM2VnMjJpSzFHL0luZXhMSWVseVdoWmI3dHNJVHZzK2hNVTBaMTl4?=
 =?utf-8?B?RVpUSE4vaklDZGhJNDc0SFBCeGxObXhuWU1WZ2tLS1VRenhmVmdhMjFSd0JG?=
 =?utf-8?B?c0toSFl5TWprd2N5L0UwRWNRa0kvWE5GMUtDejMvTnRrOHQvbGs2dG9KaEZB?=
 =?utf-8?B?T2RMQ1owUXdkcFBBT1NaaEJWVWN1bjk2bUV0VVV4NGloR1cwaW5WMmpHR2tl?=
 =?utf-8?B?a211TG9EZ0dLYmp1OFFvT3Y2ZTEycWhJVWFUWHJmWlRwaFlocjlEZHpaUTBW?=
 =?utf-8?B?cENNQmtOc1VhMEx1Q0dTRUZHbXBReFJSL3NwaCt0SjgwMmt0ZXpQakhGYW5t?=
 =?utf-8?B?SUVrMXJQYXdVUWlZVXhRZ0FuN2V3bWJMcTNhdC80YjhJSG5BUGllN2dUaDJB?=
 =?utf-8?B?WU1zaVBOcTZtOE1SckdLVlNZRFExSkJQczRhMXM3aW5hZ1grS1ZGLzBTeWlQ?=
 =?utf-8?B?MDN4MlJBTVQ1TlBBYUZRTy96ZStNRkN0UmJVblRvaWllc1ZkNlExUzZFcW9G?=
 =?utf-8?B?VnRiNjBkZlY4d1JZOEQvMXIydVg3YmpvbkZZVCtrMFJYbmVXbjlybXpkdU0z?=
 =?utf-8?B?NWpZejAxQnZic3BHTmM4UU5oNi85cmpTL2k0cEQwcWhzUGhMcjhPTWtyZ0ZQ?=
 =?utf-8?B?SWVHbjl4dkRXUmZKcWZqRERGU1BmOHJXczJUeUcvd2NaWk1lWFVpbVZORFNs?=
 =?utf-8?B?MThqNTVXMlkwSkhQMldMQkFKbWFiN0VlS3JyeklyVitCOG1NNFIvOXFlTnBi?=
 =?utf-8?B?bVNjNE45THdNWTdxeEFEdWVjNW9CL1gySXFKR3JZRnA1cWlzSkppcG0yWW9E?=
 =?utf-8?B?SXM1QXlzUm1UK3dTZllTQm5LbzE5Uzh1V0puVks4SzhYOWR5RFRDaGkvT0RD?=
 =?utf-8?B?Rm40UHJKc0hva3JlU2xJR1VpWWorYllxelJNcmRIRGJBNzhMTEdtblI4RS9T?=
 =?utf-8?B?M3dlRlZMQUR5aUNwSXJrMEtjSXRlZmRxa0tRYWRzUWM1MzIzWDZVYW1RSDBq?=
 =?utf-8?B?RG9sYkVkRU1vZkk1RHZHbFgrZnVHOXpudlU0K0JyaDJNOWJXNlRxNUQ2VlJw?=
 =?utf-8?B?emlHNTRBaDNxMFllUGx6UVU2UUpja1RoVTgzVTZqa3ppRXdFT1IrSDBqWith?=
 =?utf-8?B?QjdnNW04YlVyeDhRanZkSW52T2tscjZYZHlTN1NHTERNN1ViQzludGtVQ0pX?=
 =?utf-8?B?dXhoY3JNbzd5U3dLVzN6Y2Z4Vmp2emZHbS9ZZFR1bTBqQ2kwTy92WTVQS3pR?=
 =?utf-8?B?bHl1bUVxS3pRUXgxejYycGJSVGdVV0F6S3FKU3h5WTlsWWZ6V05qcHF5azVI?=
 =?utf-8?B?ZkFQalI1a2tuOGMrd0V3TlpuZGswVlIwbHJ3b2g4R1pCb1ZqR05BUmsvSEdC?=
 =?utf-8?B?T3JtUkZKWXFWYVBObm5wMytFejFLK2Z4dXcvUXhOeFZmRVFNUmRqYWpVOHJa?=
 =?utf-8?B?YmlkdVZVRXoyNU4xeDhKL2k0K1BENTUzRHdETEdIWU1Yb0ZnN0QwTy91YkFC?=
 =?utf-8?B?T3pCci9WNmVDbWI2MG91M0F3MFlVTnY5b2k2RGJrdzVZMXRleGhoT3RyZkh4?=
 =?utf-8?B?a1dKUVc2UEV5RGtqN2lJMytnaTVycE1lbjNoMVpDT3R6M2dGaXVVam1yeEQ2?=
 =?utf-8?B?TzJaclVvcTJic0ZoNHFWMWp1OUg3cTJQbm1FZnBBemlkTTMzcm5rL3pvTFg5?=
 =?utf-8?B?aWpCc1FqRCs2Y3lSWnRXa25XRkhLVFd1QnZTMms2ZnJkS1lNREg3bG1lczdm?=
 =?utf-8?B?T0NPNG1CM0pKcGhmOHM2bGpTcmJMK0JXWUVtSjFWa1ZWaGJVaW9jbzRFdGZP?=
 =?utf-8?B?MG5sbXIySU1yV1VpVmZhaUZkSm5TYTlmQXBiNzJFaEMzeFNtdWRram42aVBh?=
 =?utf-8?B?TE9DVkloWFlaRUp4Y1YxeUloQVRaRWFGYXJ2U0JFOFNaMzNFOG1LdXFUSTZw?=
 =?utf-8?Q?dhfHrA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q2FUbi9DeHNCZUZvTURZdEZvdGFyamFKa2xkZ1RqZG9Cdk90b0hwSG9MV0c3?=
 =?utf-8?B?aHJFUUxDQ2dyQnI4MGJEb21vd0pPMVNxelFvdDBSYkFSZFU1VTUxajh1UDhM?=
 =?utf-8?B?ckFhMm94enVKcXNqdUh5ZzEwZU1oSkgxZTNqY2Z5ZzJQQWd0SHo1QlVvaHMv?=
 =?utf-8?B?cG9CSzVYMWJyRTZ5anZBcXZmOER0c0I2bHN0UmJtOFR2Y3o0L3VFOWtUa0Vy?=
 =?utf-8?B?cHpwdDY5dzRrV0lLZ1ViWWx5MEdjM01NRUJBUmw2eEc4akRESHNpbzdkeE9D?=
 =?utf-8?B?UXhhWSthV3RGUDVqTWJjWWdMaHNucitVem5zeHRHN2h3ZjNKelZRZDJjazQ0?=
 =?utf-8?B?OHIyN3VrcC9qOGhEY1hGRmRMakp0aGFicUVzeGdEZXAwQWZiRHhvSGlQMndx?=
 =?utf-8?B?OWVJVHdxdnJEd0NIT0RSbDRoOEhJQ0UxTkpKYTZJd1pIWlBWaHJDMlh6c3NF?=
 =?utf-8?B?RWRWdEFCMXhkT0pGa29sVWJuREE2STNGQnRtaG5QNFViQWJDd1F5SlZkbkFF?=
 =?utf-8?B?Sk1HazF0eVduTmoycDZyamVqNjBtckZ4STlIRUQ1Y0pIZEVFSTQ2ZWQzcDk2?=
 =?utf-8?B?TVpTbkdTY01tcjQ1ZTl5WHY2SkQ1ekd2MVphd1pMcml5NkpvTUw0Z0U3Z0do?=
 =?utf-8?B?Z2FEcEZDUEw5ODRXcUFzTWpIY1JNcmF5dHM5Y0E2ZGtYOUxHL1JqUFp1YTRW?=
 =?utf-8?B?RXY1MkdIbEp6cmZKNHd3cTU1d0liMnZTV1l0VjZPaVJQdkFhT2w0RzdlWUNh?=
 =?utf-8?B?eWpYR3hXcHBKdm5rdTdacCtad3J2SUJHK0p3c2ZBWjFlallHcXpUTkppa2lk?=
 =?utf-8?B?OEFUczFXME9RM3RQalFGUXBZWDNOZFg4L2tBNk9OQU92VG12NFVxZ3h0eXNi?=
 =?utf-8?B?Rjd2V0FJSnJydGhkR1R1TFN2VU9IejNzYmh3czNEdTN1UThhNitYcjRFaVh5?=
 =?utf-8?B?TXZSTVZGclZxNERNU1haRnJReDBmdkNtMjlQcFJLV3gxdXNKWHovU3FvL1h6?=
 =?utf-8?B?Tm9BNDU2c3ZkWEl1YXpBeE9UeGFnRHNNK3BhNVRDRjU2TlFQRUlKL1B3MC9P?=
 =?utf-8?B?bVVIYzNpM3F2TUN0TkdCeEJoZ2lGTE9BSm5JTk1HdHl1c0NzRDIxQ1Vqcnht?=
 =?utf-8?B?ME94ZTdnOUwxRkpGMzJTUkRMK0ZWeVl2aUZLYUlQQW1SVnI2SlBWdzdxaVg0?=
 =?utf-8?B?UTFrcnVFSGhqU1V0eWR2VFBDcTVMUjN2VmJxU2J2RzF0S0ZLRzZGSUF5MVVZ?=
 =?utf-8?B?djVtdWVwMDQ0eE8yaHp0RkQ2TnpnNFZpUldlUkJqLzNPczZPd3BxUVdrZGNS?=
 =?utf-8?B?RXVuaE9FcGQyUHVlQ1JFK25KMkh2ZGRlSFpJZy9NUGVOMENYRnBQYjBSQnZY?=
 =?utf-8?B?elU1eG9vT1I0bk45UEJqbEJFVmxJTU0rNWxCVTRTVzRZUlRMTWViZ01YWGU1?=
 =?utf-8?B?N0xiZm1heUJCRGN6R2NZbTNxQkQwSWVnZEsrOGd5bVI5K2RCTEV2ckpSNVo3?=
 =?utf-8?B?eDA3b2Nhdi9iamdJSXJpUkpqbGR5d2svWm5VK0kxUkRLM3Zudy91b0pRRFIr?=
 =?utf-8?B?Y1gxTDJNM2lVYjdydm01d2JYaXVoeVgyVFN1ZzhwaHJVSGh2cGJyUXgzdUhP?=
 =?utf-8?B?eE1zWnJBNnRtNzFvZHdvSWIyV1lYVTEzb1hVU0gyL0ttclBNR3kvMFh6cVZz?=
 =?utf-8?B?cU1sQUFVUm1YWGgvL3Qxa1MrNU9vbHJTdWpRSmlBOEU3SU1ndTdXbHlvVGhq?=
 =?utf-8?B?cElEQitVeWQzOStQWmo2MHNvbTJLWEhyU1Zvc0xCNGN4UUo0VHMvc3V4UUlB?=
 =?utf-8?B?UGFXMUtsWTV0cTE3b2xobkJ1bURlTmwrcE9yOUd4b090UCt3b2VhcVg5YTlx?=
 =?utf-8?B?RE1YWEM5ZmtwOVM4clZ3RVE2Q1Q1WXBHWTZURWxIM2s2NnJQeXlta09wTmdI?=
 =?utf-8?B?V1lmbDFsdXlCY0VleGdyQUNqYUUvNnBCbEVjcU5FeHJUV2tCcEhUZlk3WGMy?=
 =?utf-8?B?SG1GRGxrV2NiY2lFS3BtTWUzQ1ZyVHRLR2h0aUlqVzJJSWRhRHdHN3VQdk8v?=
 =?utf-8?B?eG05SHJQK1VHaWFpSG0yejF2YVlOSUhENWZmbExud2xGMGt1N3NKRnhqTEI1?=
 =?utf-8?Q?jO7A=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda443d5-f5e9-4e2b-9eeb-08ddff787035
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 16:51:29.9598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EGNdIqiUTmKLQsPG7cgGaiTMDTGpEzMNw/MJtJrJHnO+9aPY2Gf9GTGRUqeQfS71xTpwvrHusRruwkxsMbaTCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9801

DQo+IEZyb206IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCj4gU2VudDog
MjkgU2VwdGVtYmVyIDIwMjUgMDg6MTEgUE0NCj4gDQo+IA0KPiBIaSwNCj4gDQo+IEkgcmVjZW50
bHkgdXBkYXRlZCBteSBkaXN0cm8gdG8gVHJpeGllIGFuZCBmb3VuZCB0aGF0IEhUTUwgZ2VuZXJh
dGlvbiBpcw0KPiBicm9rZW4uIA0KDQpJIHRlc3QgaHRtbCBhbmQgcGRmIGdlbmVyYXRpb24gcmVn
dWxhcmx5IG9uIG1lcmdpbmcgcGF0Y2hlcy4NCkFuZCBpdCBzZWVtcyB0byB3b3JrIGZvciBtZSB3
aXRoIGJlbG93IHZlcnNpb24uDQpXaGljaCBvbmUgYXJlIHlvdSB1c2luZyB0aGF0IGZhaWxzPw0K
DQpYZVRlWCAzLjE0MTU5MjY1My0yLjYtMC45OTk5OTMgKFRlWCBMaXZlIDIwMjIvZGV2L0RlYmlh
bikNCmtwYXRoc2VhIHZlcnNpb24gNi4zLjQvZGV2DQpDb3B5cmlnaHQgMjAyMSBTSUwgSW50ZXJu
YXRpb25hbCwgSm9uYXRoYW4gS2V3IGFuZCBLaGFsZWQgSG9zbnkuDQpUaGVyZSBpcyBOTyB3YXJy
YW50eS4gIFJlZGlzdHJpYnV0aW9uIG9mIHRoaXMgc29mdHdhcmUgaXMNCmNvdmVyZWQgYnkgdGhl
IHRlcm1zIG9mIGJvdGggdGhlIFhlVGVYIGNvcHlyaWdodCBhbmQNCnRoZSBMZXNzZXIgR05VIEdl
bmVyYWwgUHVibGljIExpY2Vuc2UuDQpGb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGVzZSBt
YXR0ZXJzLCBzZWUgdGhlIGZpbGUNCm5hbWVkIENPUFlJTkcgYW5kIHRoZSBYZVRlWCBzb3VyY2Uu
DQpQcmltYXJ5IGF1dGhvciBvZiBYZVRlWDogSm9uYXRoYW4gS2V3Lg0KQ29tcGlsZWQgd2l0aCBJ
Q1UgdmVyc2lvbiA3MC4xOyB1c2luZyA3MC4xDQpDb21waWxlZCB3aXRoIHpsaWIgdmVyc2lvbiAx
LjIuMTE7IHVzaW5nIDEuMi4xMQ0KQ29tcGlsZWQgd2l0aCBGcmVlVHlwZTIgdmVyc2lvbiAyLjEx
LjE7IHVzaW5nIDIuMTEuMQ0KQ29tcGlsZWQgd2l0aCBHcmFwaGl0ZTIgdmVyc2lvbiAxLjMuMTQ7
IHVzaW5nIDEuMy4xNA0KQ29tcGlsZWQgd2l0aCBIYXJmQnV6eiB2ZXJzaW9uIDIuNy40OyB1c2lu
ZyAyLjcuNA0KQ29tcGlsZWQgd2l0aCBsaWJwbmcgdmVyc2lvbiAxLjYuMzc7IHVzaW5nIDEuNi4z
Nw0KQ29tcGlsZWQgd2l0aCBwcGxpYiB2ZXJzaW9uIHYyLjA1IGxlc3MgdG94aWMgaSBob3BlDQpD
b21waWxlZCB3aXRoIGZvbnRjb25maWcgdmVyc2lvbiAyLjEzLjE7IHVzaW5nIDIuMTMuMQ0KDQoN
Cj4gQXMgZmFyIGFzIEkgY2FuIHRlbGwgdGhpcyBjb21lcyBkb3duIHRvIHRoZSB1c2Ugb2YgXGNs
aW5lIGFzIHNob3duIGluIHRoaXMNCj4gbWluaW1hbCBleGFtcGxlOg0KPiANCj4gICBcZG9jdW1l
bnRjbGFzc3thcnRpY2xlfQ0KPiAgIFx1c2VwYWNrYWdle2hobGluZX0NCj4gICBcYmVnaW57ZG9j
dW1lbnR9DQo+ICAgXGJlZ2lue3RhYnVsYXJ9eyB8bHx8bHxsfCB9DQo+ICAgXGhsaW5lDQo+ICAg
Qml0cyAmIERldmljZSBTcGVjaWZpYyAmIFB1cnBvc2UgXFwNCj4gICBcY2xpbmV7MS0yfQ0KPiAg
IFJlYWQgLyBXcml0ZSAmIERldmljZSBTcGVjaWZpYyAmIFxcDQo+ICAgXGNsaW5lezEtMn0NCj4g
ICBQdXJwb3NlICYgRGV2aWNlIFNwZWNpZmljICYgXFwNCj4gICBcaGxpbmUNCj4gICBcZW5ke3Rh
YnVsYXJ9DQo+ICAgXGVuZHtkb2N1bWVudH0NCj4gDQo+IHdoaWNoIHJlc3VsdHMgaW4gVGVYIGVu
ZGluZyBlYXJseToNCj4gDQo+ICAgISBVbmRlZmluZWQgY29udHJvbCBzZXF1ZW5jZS4NCj4gICBc
ZjpIQm9yZGVyIC4uLmJvcmRlci10b3A6MXB4IHNvbGlkIFwjXGhsaW5lOmNvbG9yDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA7Ij48L3RkPg0K
PiAgIGwuOCBSDQo+ICAgICAgICBlYWQgLyBXcml0ZSAmIERldmljZSBTcGVjaWZpYyAmIFxcDQo+
ICAgPw0KPiAgICEgRW1lcmdlbmN5IHN0b3AuDQo+IA0KPiBJJ20gbGlhaXNpbmcgd2l0aCBEZWJp
YW4gYW5kIHRoZSBUZXhMaXZlIGF1dGhvcnMgdG8gdHJ5IGFuZCBmaWd1cmUgb3V0IHdoYXRzDQo+
IGdvaW5nIG9uLiBIb3dldmVyIGl0IGRvZXMgcmFpc2UgYSBiaWdnZXIgcXVlc3Rpb24gZm9yIHRo
ZSBzcGVjaWZpY2F0aW9uIC0gd2h5IGRvDQo+IHdlIHVzZSBMYVRlWD8NCj4gDQo+IEkgZG9uJ3Qg
ZG91YnQgdGhhdCBpcyBhIHBvd2VyZnVsIHR5cGVzZXR0aW5nIHN5c3RlbSBidXQgaXRzIGFyY2Fu
ZSBzeW50YXggaXMgYQ0KPiBiaXQgb2YgYSBiYXJyaWVyIHRvIGVudHJ5IGVzcGVjaWFsbHkgZm9y
IGNhc3VhbCBjb250cmlidXRvcnMuIFdpdGggdGhlIHJlY2VudA0KPiBicmVha2FnZSBJIHdvbmRl
ciBpZiBJJ20gdGhlIGNhbmFyeSBpbiB0aGUgY29hbCBtaW5lIGFuZCB0aGlzIHdpbGwgcG90ZW50
aWFsbHkgYmUNCj4gYSBwcm9ibGVtIGZvciBldmVyeW9uZSBlbHNlIG9uY2UgdGhlaXIgVGVYIHNl
dHVwcyB1cGdyYWRlLg0KPiANCj4gSSdkIGxpa2UgdG8gYXVnbWVudCB0aGUgcmVwbyB3aXRoIHNv
bWUgR2l0SHViIGFjdGlvbnMgc28gd2UgY2FuIGtlZXAgYW4gdXB0bw0KPiBkYXRlIHJlbmRlcmVk
IGRyYWZ0IGF2YWlsYWJsZSBhcyB3ZWxsIGFzIHNvbWUgbGludCBjaGVja3Mgc28gd2UgY2FuIGF2
b2lkDQo+IGludHJvZHVjaW5nIGRvZGd5IG1hcmt1cC4gQnV0IGZpcnN0bHkgSSB3YW50IHRvIGFz
ayBpcyBMYVRlWCB0aGUgcmlnaHQgc291cmNlDQo+IGZvcm1hdCBmb3IgdGhlIHNwZWMgZ29pbmcg
Zm9yd2FyZD8gSXMgdGhpcyBzb21ldGhpbmcgbWFuZGF0ZWQgYnkgT0FTSVMgb3INCj4ganVzdCBh
biBhY2NpZGVudCBvZiBoaXN0b3J5Pw0KPiANCj4gVGhhbmtzLA0KPiANCj4gLS0NCj4gQWxleCBC
ZW5uw6llDQo+IFZpcnR1YWxpc2F0aW9uIFRlY2ggTGVhZCBAIExpbmFybw0KDQo=
