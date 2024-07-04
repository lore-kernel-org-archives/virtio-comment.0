Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014AF1AED45
	for <virtio-comment@lists.linux.dev>; Thu,  4 Jul 2024 16:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720109585; cv=fail; b=fXhaCjvhPPYBJEt6EIeeOAiuvhoVcuWBpP6D97e8cpfvI/9fWt1T6I/NQqoG2merlNlz3IN6fKE4/UXZFE6gKN1T2AsStHkY7xQJ5HNLEt/RFPNQPS0H9SzdvWf8N08En7281jE7ML1jpieuB0x6WA5kmyplhDy403UD0AWjdWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720109585; c=relaxed/simple;
	bh=9/MmtBQ+YCIA0BPZOUTgyWRsIC8ZWA3jll+EQYpZyiI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SUtvOVjfeWlYlIS6JAFUeW2KAOpaKdL5dl7ZPecp31bOkt/f3nOFnb9/1SE/iw16lyRHoh7jOHF4+5KJu4L8Yc6KUnG0HKT2Lq5OsaR8IEdUqmSWVVG8/7gopYaPuEtIFEKspVPVCpI474ss6S7xmgAwRzG0WKOD+9vek+vcs+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QhyK1G/p; arc=fail smtp.client-ip=40.107.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QhyK1G/p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AA/o+sBGPCz4UQNE789NnYh+Fh0vGL1N6BHCcOK/IuKQEBFpmRsfXnLrhOhqNoibp4CkezJMODTOU/ZvYjAl+d/ARkak11+q6mn9a7dv+7bIXrwLawK+GmO6eDoKVBe8Zz4Y6KsZpyTL8y0hK8GRN0cF2LKSUic1/NiGIYBFe5xuq1zvzZbXQP1/FeqM9uEhk/0nYadXcZptS19Kv/XgWEfwMNgRSo+nlT7UiorD8MxA1op6pjSRs+pb7sYqZiM/upkFTUsrvqIFtfznuecExYefIwmZfU8HlvAPvjEI/Cq+KDSYCgablQ+ksFkokRLT8N8jHONMNN9LFVwd4m6bQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/MmtBQ+YCIA0BPZOUTgyWRsIC8ZWA3jll+EQYpZyiI=;
 b=kb/JdDgKMW5zZG73GTM2k8EOsDU9jR68ZKqjKprCDaMh42JqDENiNc42z8EYu85o71KUP6GjJG9iErk3ynymoKiDCUcgqEieL4yGOiUvPqGObQYYeCsteEPdoxBSMHOtnfGwUR3gy2v9sxq/1oBjFcgFh/Ei1Jebya8LwGKAGyltWJBlGGyuInGLyCvgpRwJgFX0omMewktL6UOPuK7h3L0P15esYGq+d7QjorrCSmYbgerZxnCXJx2Wg6RmNrql//ITj6xYGEf8W4zGWQy8qjfmBP63PYe2yg6EJcZYtP/gXehYVg8etapEhZFeHHZInpT/Fb2TlSJEfvqN5pwnjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/MmtBQ+YCIA0BPZOUTgyWRsIC8ZWA3jll+EQYpZyiI=;
 b=QhyK1G/pozpafNvnYvzGykpVdGqF6cMWCSO+DTE6/HXRDhsb4kFfqcpaOce7DzLBBvBafJ8Ue3ndm010fctwiSjdq+HjjnMc/hhdgKoC5/7B+exuVwmLSLD1S2DFAFepEGTs8G6lqthbIQiMA6kTinoeB2Oys0C0ujN24OZUEV9iJwYuJYyZOSzeB64e1U444baSp+jI8n0HeV6fYFyaL9bG2lTiYnJz0CLepfOx/WMz+mcGFZPMRd2nC5wDxqeVCI4hx2lxGaqYYj9SodnmG56Vlm+bOmjtDH9J2d7TzpRplKR/qaxxjeyHsxn5zt/Gn5AawImPHO7/pQ059EOQKQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SN7PR12MB8169.namprd12.prod.outlook.com (2603:10b6:806:32f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Thu, 4 Jul
 2024 16:13:00 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%4]) with mapi id 15.20.7741.029; Thu, 4 Jul 2024
 16:12:59 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Keiichi Watanabe <keiichiw@chromium.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "uekawa@chromium.org"
	<uekawa@chromium.org>, "takayas@chromium.org" <takayas@chromium.org>,
	"dverkamp@chromium.org" <dverkamp@chromium.org>, "tytso@google.com"
	<tytso@google.com>
Subject: RE: [PATCH 1/1] virito-blk: Support NOSPC error
Thread-Topic: [PATCH 1/1] virito-blk: Support NOSPC error
Thread-Index:
 AQHawWrdwzcIsa1R1kKu7fjMnv5ZY7HNZ83AgAAIoQCAAaCGgIAXPauAgAAdg3CAABkLAIAAUbqA
Date: Thu, 4 Jul 2024 16:12:59 +0000
Message-ID:
 <PH0PR12MB5481DCAF22243525A43B3134DCDE2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
 <20240618081858.2795400-2-keiichiw@chromium.org>
 <PH0PR12MB54811C1FD9D666D13077E817DCCE2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240618081240-mutt-send-email-mst@kernel.org>
 <CAD90VcZAkXVfciJnzH+qjgiCFaqMK-Ne-0uL2o3EKcN_At_X1A@mail.gmail.com>
 <20240704035749-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54800E46BF03E95379A5E8CBDCDE2@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20240704071839-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240704071839-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB8169:EE_
x-ms-office365-filtering-correlation-id: ab407f73-cb15-4929-3213-08dc9c442c63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N1FRc0dZYkk2SUIrS0MwU0hmUWZkL0dGUFk2RFREUDI1NDFuQVNneDJtREhL?=
 =?utf-8?B?Q2V3aURVUWxXQzRycWlTeUF4K0Y0WHV0M1BnR2lScDd0QTZiVTNDdTh2MjRj?=
 =?utf-8?B?Wlk3d29HdVhYL1NqQlFPTkxteUxLVE9FTHhqejluVzVENmZ3RDNZVTdVQmlB?=
 =?utf-8?B?NmZYc3c1NTlkd3J2WGVXTFZCUGEwTGpBOHYrRC9iUWhySmlMZ1pVcFFHYVJv?=
 =?utf-8?B?bXI3K0JJTjBtMkhFdDlsSHMvZDkzZjZIbng0Y29DSXlDZVFldXFUTEhuczFE?=
 =?utf-8?B?SllQTmErTmg3Q2duVWRMTDloYmg0WmFwS2RVSWpkdUFmVjRRcUh4MVdORUFX?=
 =?utf-8?B?TWhKbUhTQ0RnOXBvdmNlajlReTB1ODdVdndyL0dDYWUzRUJGUnh0RWNtS20x?=
 =?utf-8?B?dndxZzR4ZjBvTms5STBYWTdLQWcyT2VMbjNHclFwdVI2NGpBbGJMMmxZNUsz?=
 =?utf-8?B?R21HTzlVQ2FKS3BheFd4OUN3RDR0dk5lNk1JWCsxQ3lteTgwbGJzMEs0TlpB?=
 =?utf-8?B?eW5vV05xOWNDOEoyeGV1cFJodE9SN1JhMXBMb05sU1VYR2hpZEI1RUpvZHl0?=
 =?utf-8?B?RTBkSlh2L2UrcmJhUW5mL2dwaGFFS1ZjRVc2Z1l6V0Y1aTFqV0FyZ0ZieTlQ?=
 =?utf-8?B?WDFWM0xGZHJWYjlWeU0xNmpSOXRvM0x2WFdycEFadTJhbXVqT0thT3JleTVs?=
 =?utf-8?B?ZVVzbWh3Zm8wcFFWa1hnbDRnT0VxUm1ITWE4TGhNUVdJN2hHYUZMVERYOExB?=
 =?utf-8?B?Uzl6bVhSTkN6Y2RNWXRmbWpoVytVY0FvRFI3RlBTb3h2N3l2Z2hkMEN3Q2V3?=
 =?utf-8?B?RC9kaUZYVnZkRENoTEJuc0JPMmRyRm5LWXlza1RuWFpJMUV0dlprVVFLK2p3?=
 =?utf-8?B?cjQrOCs5TCtVOHVHbHljSXhieUlPU1VEcTdTa3lSOTI5d3RvcW91c3J6WVFz?=
 =?utf-8?B?VmRYWU04S0RhTmRTSkhyWVJTRTVuVmJPS1lQTis3b1Y0N1lTZHFFSHpHWnJ3?=
 =?utf-8?B?WTNSWFdGVGlmcmpRS2VSaDJpcGg2ejZwOWo0T3B4bEVpV2tNYjlyOE1YSk9F?=
 =?utf-8?B?VXRWb3pPMUNDdmJWTkNrZERsY2M5L29udDRDd3ZNcmgyVTZnbG8wQ2RKMks4?=
 =?utf-8?B?NTY0V1lyTUl3K1BRRVhsa1BmNzVJd3p6VU1Bck5ibWh0NjV1OFlMOXhvajl3?=
 =?utf-8?B?Rm1xK3hSSURiMlVxUzdIUTJmeWEvSjNpeGZ2bVcrdVp6MDA0dnVqaE1HTm9i?=
 =?utf-8?B?MWxNZVpxVTBrdzZPOVB4QTBmai9hamJqZGErdkM3bmp6RlJUZ214c1Q0QmxW?=
 =?utf-8?B?NmpmeDFmTFNPS3Iwbk5tcUJlenZrRlh6YTNTODhMbEYvdDVSeVhhL1FIa0Ns?=
 =?utf-8?B?V3libmR2d243N2hoY1RnZEJvc3hwWVpDMEtmL3JoMW0vWFFWNzNKb29mSC9X?=
 =?utf-8?B?WDZ4TjZlU0c2eXc5UGRHRmFEME4zL3UzN0UwUHNZcFFWbXhselU3aHdmWVUx?=
 =?utf-8?B?aW0zVy9Rc0F2ajZhbVJyUGJ6TitEMU9USFB2Rm9sazRMN3l3ZEFYcVg5V2U0?=
 =?utf-8?B?MmFtSUd3ZkE3SXFmV2RRVDJXcS94RkNTSDN4cjV1L3lRYnpQdVA4WHcrZWNu?=
 =?utf-8?B?Y0hWN1FqODRUUHFlVUUxemdFdGRydXFJdGZTd3B6WmVlM0pOQUxwNzNVREI1?=
 =?utf-8?B?aWlnZmdlb2VxbEhoWTIwWG1BcWQ3dm9nUHVqbkZCbTlXbVdqYjFjZ1JBNDNK?=
 =?utf-8?B?bURKbkdaRFBUdzlWbnpjYkdkOERuRzVUUDBwdTNLdm9rdnFFMjlwd0x4NHlT?=
 =?utf-8?B?ZCtaMnE5MVE2RTZidm04QT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MEF4MGprb05PYm8zMy9BQUkyM1ByZjBpSUJUemtmWVhlQ2tBN1FLTlcrY0Jz?=
 =?utf-8?B?R29GRG1rVDdVbSt6WWpXR2JIbndOY09IYllGYlNjUU5ZdzJnb2YrRythNEwy?=
 =?utf-8?B?N01BQ0FzQkFRbm1kYjkrQ3IyM2QreHB6S3hKSkovb1BjWXBONWZrdzYzR3Rw?=
 =?utf-8?B?UVFTaVcxQ2FKb2RoQ0pyMExTVGV4UThKUW92MGZ2ZlhIeE9IZ204SXhieVY2?=
 =?utf-8?B?VHhaWHhPckJKR3U5WHhUV1h5VUNNT1FxTjlrWGhIK01Uc3JWSDZENk03Z1Z4?=
 =?utf-8?B?NGFJWUhydlhySFpFSkl3dEFaeE15cmJaM0JhUVhRd0ROS1FqWnNJQlc5Vm9i?=
 =?utf-8?B?bDRMU1JZY0dNUmFhR1FWbWg0VVFZenc1bmNPd0k2MUw1NU9VQXAyaWdhMTVR?=
 =?utf-8?B?VlE5MzlRc3BoL3RqNG1TdG5oS3ZsZUpuRDBkU0ROYkpuUlpOUlhSOThkNTZS?=
 =?utf-8?B?STZBQ2FPMGZ1RkFVeDd0QVJ1bjlTL09zZmxOMyt5c3ZyaHNWN2JncmZwMk9o?=
 =?utf-8?B?ZElyamI2OFpjQk1iL2hQb1RUSzJWbXNMSVE0ODhVZVV4OFdvOUNzRWVmb2FJ?=
 =?utf-8?B?eS9QeC8rREh6bk9JWWcvazlsNXgzQ1hQVXpDR2x1NitUV2UwOE9pd3o2Wk5F?=
 =?utf-8?B?dGpGRDN6V0dWTCtWR1hGb1hQaWVYa1hjdUhhU3BwUFoxQ0taRnZ5b0ZwZ2JY?=
 =?utf-8?B?ZDZybXhIeGhnRTZ6U0VYTG94WnRpMGZUVHlsYVpxZ3Awa1Baa3VuSENoZDR1?=
 =?utf-8?B?aTd6K09HYXprSEN4a05Vb2dNM2NYaytzejVNYTlDbUpmMXQ3TUNJU1ZvY29y?=
 =?utf-8?B?a0E1VW1pK3A1dkEwdmR6NFl6TlZHTkRVSElkTWdJLzVrUTcrckZpb1F1OEJX?=
 =?utf-8?B?cXQzTmJUZnFyZ3dxWjA5UW1WTm51dWZuMXRmaWgzK0pxZ1hhSDJLM2pCRklM?=
 =?utf-8?B?NUFNejZDck9PZUJGRDRHTkZ6ZTRtdldNS1Q2ZjRsZ29XOVhENE9VeHJ6b0d3?=
 =?utf-8?B?Qktic0pZQTJHQUdJVHNaRVRvZGNEV3hkVW03dVRsdko4TDZrRU9iUVlvL1hC?=
 =?utf-8?B?U1Riem85ZzBwSTkxMXJ6QnlPYzJINTlHODRiNU96dmhqVjdmVmtocnd6alVR?=
 =?utf-8?B?eDM5aE1rdkp6dGRRZURMZm9WeUVPam1mdUhVMDJ3TFZlajlQVWZmWnMyb1R1?=
 =?utf-8?B?VDlDY0piaWpzbWFxWDM4MjQwNG1BSzg2MThTbjliYVQwUVVpcGdWcXpyVHNp?=
 =?utf-8?B?bWJ2U1kzeTdGTnQzeXM2aTdCcHp5Z3hOUXJMSDQyU3BsQVp0T3hKWGZtTkJo?=
 =?utf-8?B?ZUdZUzZQa2pmSTgxSDh6S3BIZ1UvM3gxTVptcWszTS9oTmIzTk9JMityeE9F?=
 =?utf-8?B?Rmp3WnlxQWswZ1NEOFJ4MTRWN0lCTlN1Z05WSUVxY3lHeWxwTzJFRDRqUysw?=
 =?utf-8?B?S21hU2ltQnd0NndlREIxbDJOUWw0c3NiWDZMSFNrRmVEMW1qTktkZElzd0ZC?=
 =?utf-8?B?eFBGZitnVGdaSkVCTGNISE9JZWNCR0pxQWpwL2RmRDNZS3F0eXNxL0VMVk5F?=
 =?utf-8?B?amtCVFFFMzhydVlVc1pHK1czYjlTeklTcno5S2prVzRqQ0Zkek5wS2NXRXVQ?=
 =?utf-8?B?RjF4Syt4MTg0SmpsKzR5R0NSQXVzN01UZzJuSi9SeXFFeU55dXJERWFvZGRa?=
 =?utf-8?B?anc2aU1laUxXUUZnWGE0K1lyZXJPbXBoUTBlUzZ1eHlaNGs5cllCbk1lZUw4?=
 =?utf-8?B?K3QvVE11Vi9DUHo0TVA5OE9aTjNVNlFWenBJVENaQ1d6ME9ud1lRa0d2WGY2?=
 =?utf-8?B?OFJrakkzVi84TVdJc29tS25zM3NkZ0tvWVRMK0s5ak56aEJweHdSaVJkaWRl?=
 =?utf-8?B?V3RSUmJXK1d3RnBsTEt5dmN6V08yamx2Vy8xQ21xbUdYY0kxTkt5cmdZVDhx?=
 =?utf-8?B?di9xZ0F3ejlEY2lkY1FLSTcrSjErbGo4Vitxa0k1aVJ4aUViaXVqb1VpeEZX?=
 =?utf-8?B?RFo0djh3OW1MSGp5VnRpSGRQSTdKYWdrMS95RzFMRlkvTDJlSzBvcnpEVlFt?=
 =?utf-8?B?Y0xyYXV0R09FTDNsUldxcGQ0WG1sN0w2MWEwWG1PUy9TUmx5L3FIeUpxeWlV?=
 =?utf-8?Q?uxF4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ab407f73-cb15-4929-3213-08dc9c442c63
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 16:12:59.5601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 235lX5RSbzkpCZgLgcPIIJSN8WDWJmiN9OISUMZF2bXeRgK++aL2/wKTnjmBRvwhPCRLU3Bo83bgIm4nYASt4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8169

DQo+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBKdWx5IDQsIDIwMjQgNDo0OSBQTQ0KPiBUbzogUGFyYXYgUGFuZGl0IDxwYXJhdkBu
dmlkaWEuY29tPg0KPiBDYzogS2VpaWNoaSBXYXRhbmFiZSA8a2VpaWNoaXdAY2hyb21pdW0ub3Jn
PjsgdmlydGlvLQ0KPiBjb21tZW50QGxpc3RzLmxpbnV4LmRldjsgdWVrYXdhQGNocm9taXVtLm9y
ZzsgdGFrYXlhc0BjaHJvbWl1bS5vcmc7DQo+IGR2ZXJrYW1wQGNocm9taXVtLm9yZzsgdHl0c29A
Z29vZ2xlLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMV0gdmlyaXRvLWJsazogU3VwcG9y
dCBOT1NQQyBlcnJvcg0KPiANCj4gT24gVGh1LCBKdWwgMDQsIDIwMjQgYXQgMDk6NTI6NTJBTSAr
MDAwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+ID4gRnJvbTogTWljaGFlbCBTLiBUc2lya2lu
IDxtc3RAcmVkaGF0LmNvbT4NCj4gPiA+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDQsIDIwMjQgMToz
NCBQTQ0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgSnVuIDE5LCAyMDI0IGF0IDEwOjA5OjE5UE0gKzA5
MDAsIEtlaWljaGkgV2F0YW5hYmUgd3JvdGU6DQo+ID4gPiA+IFRoYW5rIHlvdSBmb3IgdGhlIGZl
ZWRiYWNrLiBIYXZpbmcgdGhlIG5ldyBmZWF0dXJlIGJpdCBtYWtlcyBzZW5zZS4NCj4gPiA+ID4g
U28sIEkgdGhpbmsgd2UgY2FuIHVwZGF0ZSB0aGUgc3BlYyBhcyBmb2xsb3dzOg0KPiA+ID4gPg0K
PiA+ID4gPiAqIERlZmluZSBWSVJUSU9fQkxLX0ZfRVJSTk8gZmVhdHVyZSBiaXQNCj4gPiA+ID4g
KiBJZiBWSVJUSU9fQkxLX0ZfRVJSTk8gaXMgbmVnb3RpYXRlZCwgdGhlIGRyaXZlciBzZW5kcyB0
aGUNCj4gPiA+ID4gZm9sbG93aW5nIHZpcml0b19ibGtfcmVxX3dpdGhfZXJybm8gaW5zdGVhZCBv
ZiB2aXJ0aW9fYmxrX3JlcS4NCj4gPiA+ID4gKiBJZiBWSVJUSU9fQkxLX0ZfRVJSTk8gaXMgbmVn
b3RpYXRlZCwgd2hlbiB0aGUgZGV2aWNlIHNldHMgc3RhdHVzDQo+ID4gPiA+IHRvIFZJUlRJT19C
TEtfU19JT0VSUiwgdGhlIGRldmljZSBtYXkgc2V0IGVycm5vIHRvIGEgcG9zaXRpdmUgdmFsdWUu
DQo+ID4gPiA+DQo+ID4gPiA+IHN0cnVjdCB2aXJ0aW9fYmxrX3JlcV93aXRoX2Vycm5vIHsNCj4g
PiA+ID4gICBsZTMyIHR5cGXNvg0KPiA+ID4gPiAgIGxlMzIgcmVzZXJ2ZWTNvg0KPiA+ID4gPiAg
IGxlNjQgc2VjdG9yzb4NCj4gPiA+ID4gICB1OCBkYXRhW13Nvg0KPiA+ID4gPiAgIHU4IHN0YXR1
c82+DQo+ID4gPiA+ICAgdTggcGFkZGluZ1szXTsNCj4gPiA+ID4gICBsZTMyIGVycm5vOw0KPiA+
ID4gPiB9zb4NCj4gPiA+ID4NCj4gPiA+ID4gRG9lcyBpdCBtYWtlIHNlbnNlPyBJZiBzbywgSSds
bCBtYWtlIHYyIHBhdGNoLg0KPiA+ID4gPiBOb3RlIHRoYXQgSSB1c2VkIGxlMzIgZm9yIGVycm5v
IGFib3ZlIGJlY2F1c2UgUE9TSVggc3BlYyBbMV0gc2F5cw0KPiA+ID4gPiBlcnJubyBpcyBpbnQg
YW5kIGludCBpcyB1c3VhbGx5IDQgYnl0ZXMuDQo+ID4gPiA+DQo+ID4gPiA+IFsxXToNCj4gPiA+
ID4NCj4gPiA+DQo+IGh0dHBzOi8vcHVicy5vcGVuZ3JvdXAub3JnL29ubGluZXB1YnMvOTY5OTkx
OTc5OS9iYXNlZGVmcy9lcnJuby5oLmh0DQo+ID4gPiBtbA0KPiA+ID4gPg0KPiA+ID4gPiBLZWlp
Y2hpDQo+ID4gPg0KPiA+ID4gVGhvdWdodCBoYXJkIGFib3V0IGl0LiBJIHRoaW5rIGV4cGFuZGlu
ZyB0aGUgcmVxdWVzdCBmb3IgZXJybm8gaXMNCj4gdW53ZWxjb21lLg0KPiA+IFRydWUsIHNlZW1z
IG92ZXJraWxsLg0KPiA+DQo+ID4gPiBXaGF0IHdlIGNhbiBkbywgaWYgeW91IHJlYWxseSB3YW50
IHRvIGRvIGl0LCBpcyB3aGVuDQo+ID4gPiBWSVJUSU9fQkxLX0ZfRVJSTk8gaXMgbmVnb3RpYXRl
ZCwgdGhlbiBtYWtlIGVycm9yIGNvZGVzIGRpZmZlcmVudC4NCj4gPiA+DQo+ID4gRG8gd2UgYWxz
byBuZWVkIGEgZmVhdHVyZSBiaXQ/DQo+ID4gSWYgdGhlIGRldmljZSByZXBvcnRzIHJlcS5zdGF0
dXMgPT0gRU5PU1BDIGNvbnZlcnQgaW50byB0aGUgTk9TUEMgZXJyb3INCj4gY29kZS4NCj4gPiBJ
ZiBpdCByZXR1cm5zIFZJUlRJT19CTEtfU19JT0VSUiwgdGhhbiBnZW5lcmljIEVJTz8NCj4gPg0K
PiA+IFRoaXMgaXMgYmVjYXVzZSB0aGVyZSBpcyBubyBnYWluIGluIHRlbGxpbmcgdGhlIGRldmlj
ZSB0byByZXR1cm4gc3BlY2lhbCBlcnJvcg0KPiBjb2RlIG9uIGhpdHRpbmcgYSBzcGVjaWFsIGVy
cm9yLg0KPiA+IEl0IHJldHVybnMgdGhlIGVycm9yIGlmIGl0IGhhcyBzdXBwb3J0IGZvciBpdC4g
dGhhdOKAmXMgaXQuDQo+ID4NCj4gPiBJIGFtIHVuYWJsZSB0byBzZWUgdGhlIGJlbmVmaXQgb2Yg
ZXh0cmEgbmVnb3RpYXRpb24uDQo+ID4gV291bGQgdGhpcyBzaW1wbGljaXR5IHdvcms/DQo+IA0K
PiBObyAtIG9sZCBkcml2ZXJzIHdvbid0IGtub3cgaG93IHRvIGhhbmRsZSB0aGUgbmV3IEVOT1NQ
Qy4NCj4gDQpPay4gZ290IGl0Lg0KeWVhaCwgZmVhdHVyZSBiaXQgY2FuIHRlbGwgdGhpcyB0byB0
aGUgZGV2aWNlLg0KVGhhbmtzLg0K
