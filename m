Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07A220DD4B
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 10:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589506; cv=fail; b=Rsh12Bues64XKU8j/siB2obvO6IdHE9z6rc2O5IozahX2Tvb3riLodKGUyhFKafUm5uQJ5kAcHohI8GmJQ8NMFuU/zTIYbhOr6affD0DZed3b+r8GqSDC1wwbpM8aer99l/1gzUMQHXqv1+LqM2mAN3JluvRWs7KJ9dXS7XiTd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589506; c=relaxed/simple;
	bh=poOwW+Nf650joka0JvN7LVEC9RZ7iGPTY2CT6BOtFl4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q+DlKG+pSg/abhHKanCEAcHlDnASrfpRFXFXlFehyWqc+R3mhJWA6DOOHK93kNPiFPBIcw567L+/Xa6ULvyRfzqjeufpW6vQ9rdSm9BTjwIMtZ2KUUDvHGqxSvJxi2Vx/HZZ7IPFIweCgZa5LkkDLz7Y5EAtLQBqqCoHgoIPAn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BkGEzq1i; arc=fail smtp.client-ip=40.107.243.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BkGEzq1i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RITyMY9aWKA1tSF5hZ3Jt415WDYaoE6Ia0f3eB/dr5+Qn7TpDpNEjOP/7eXkzrLmpxdDysc7F27lWhET9GmPrGaGBATDciL+WBav8T7LmqHLXPE4RkWpd3v9qf6C+pQyusoArZTYiIVNKOnLinjF+EvqsAg62nmibXyPzcJQ7104cKFHCtoXznVLdaPJWokwFBVZHHAeye5Sy9nm6Z6LWDLFOu32Cyoiirc8aVhTVNxMWa94XXmA09Egt4TBT0Yjpr+khoC+hPqtBzcnRHytejYhnXQH7+cPK8EZO2Hi3GE3tbQI5jv/a8niD4GVIOf4V96ACJdJsI6DL2QKUAvF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poOwW+Nf650joka0JvN7LVEC9RZ7iGPTY2CT6BOtFl4=;
 b=ySBrVptS6qqeXTA0/4CDcYnQpbEbgzUSz+3ifZEhgNuVAXdmkqLtLeQnmeIioRjcga6xOJzJRwt+vdCJOkyJyESV6kUS03Mx2E5/eHdV3cvM5SK9Zg18liksgITTnALgesGsBFiR1RtBkPBJpKCRWxjsbXqYLTVOYu3zlIj/P9t2u8IrbpCWPshVUBsZaMA+x2vGNlF/PROOtQsmUugOSRHuVOeo22+Fy3U1owvdjaZq4X/OGuaOCA/iV5poe0EbbPMHoP6owZGgLjFy9AKZGBP4EZ5DpgmQGIS0H5GP9N+FPaD4NhAKH45W30VcXy1zapFJmvboOk9eSV0tJvdtVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poOwW+Nf650joka0JvN7LVEC9RZ7iGPTY2CT6BOtFl4=;
 b=BkGEzq1iAFNCLanAyTZGUvXzgWx3d3Ni6mKmYUOfgPUJkHxTjWdQBhROrYL+MkFAJ7Jo1ExCyN2O1qBVnJ+MNAri3EVqremg/WO6pyW48q6hu4mq68xoiI+eQc9JIo+AWohORmTNAQTOSqEmfSuD6EzPG9HiHV5FWW69XTEgvgyBfRZLiY9JnFek5Wu7YbJWD/Mxuc9hfF8ALbrX1LZiMNPfZI0Yoa4fhT8FSfN3IcZFEMKYJ7guO2dq5H/9dg5rd8OpsqTaZ+d32sU4t3obky0P9Z+TirDU3H4lOLBH59FPoj5y7/Z5/X8YgOfTJZjYH/jpfR/UnCkozASNbIA01A==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MN0PR12MB6055.namprd12.prod.outlook.com (2603:10b6:208:3cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 10:25:01 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 10:25:00 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, Matias Ezequiel Vara Larsen
	<mvaralar@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, "mst@redhat.com"
	<mst@redhat.com>
Subject: RE: [PATCH 00/13] Backport 1.4 fixes to 1.3
Thread-Topic: [PATCH 00/13] Backport 1.4 fixes to 1.3
Thread-Index: AQHbowsFd2JqpDAL/UicNGhKPNrIArOQG20AgAANVPA=
Date: Wed, 2 Apr 2025 10:25:00 +0000
Message-ID:
 <CY8PR12MB71956AADC6DBE9891FE9CA9BDCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250401133543.801184-1-mvaralar@redhat.com>
 <87y0wiapex.fsf@redhat.com>
In-Reply-To: <87y0wiapex.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MN0PR12MB6055:EE_
x-ms-office365-filtering-correlation-id: 0b2e5b10-ed01-4df2-f4f5-08dd71d0a00e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SWo2V28vRWp3dGl2TnFlMkJpVzhWRXJFdlU2L1BzenBqckFQVjd0NnlCNnQ5?=
 =?utf-8?B?Q3UyOUxPTmgzT2x3R1FMcEZQYmxIdVg0TmN2UHdLM0xtNzMzM3hpU0R4QXhl?=
 =?utf-8?B?RVBkUUhQWlc2Z2ZPcVVhL1FMT0ExR0ZzWU9odllnWXBOamVxZXo3bXEzOWtw?=
 =?utf-8?B?dXpvNloxNWVpcXpjRWpwZ051a1k5M0Q3eHVNWWFlVUQyaml1TDh4VzE3dEpv?=
 =?utf-8?B?NE1WNkh2TGFDN2JHa0dJNFRNZU9PS0tERDEza0loTGtPZ2QycmZRWnNLUmR2?=
 =?utf-8?B?Sk9nYnpiOUNUcUJCeXNjOHkzZ1V6Y1JaK2o1dXAwYkp0RnVLNjVJaDU2Y0xN?=
 =?utf-8?B?ejh0Ym1QWEZRc29YclRsSXpROExaYTA1cXhqZlJReWF5Wkt6OHNUVTkzMnJB?=
 =?utf-8?B?UDIwTVJDaWp0M29TckVYZEdmVTNnc1ByenAydmlPSXVFT0d0UDM2Zkd3N25Z?=
 =?utf-8?B?ZXdxeGNFZTNHNmxrSjg4bWhzWk9LZU1iU3BNL0Q0OXdicUxaMjdwdCtkVEN5?=
 =?utf-8?B?VEtxaEdxSGs5bDZKZE5nbWNvaFhPMGVvMzVuMnpJTFQwRi84cno3ZUFSQ0ts?=
 =?utf-8?B?N1hkeTBEalYzUzZNaGtSM29MOXZGYzNxUzFFLzhPdkdRVm9BVEQzdldCNjZN?=
 =?utf-8?B?cExZUFZLQmV4SXJkSWhpbHlLcDVtSG9vL0Y1YnBTWnlqVDRnRmJ2a01keHVa?=
 =?utf-8?B?dlFHSFRrclFYZzNsQjBYcWlILzlrZUFJRnM4czhpRnVsK3R5d2tqWlREMzlT?=
 =?utf-8?B?eWhCNHIyRk5VSjcwWDhTVnduMkwrQWMvZERyRVR1L2RNaHhYSm40V2ttWTZp?=
 =?utf-8?B?SEllN3pFdWpNemVsTkRPNHp3WXBKTVFPU3BhVWUzbWdpMFJZcUNQMlJRdFMv?=
 =?utf-8?B?TC9ML0l3cGhyMmhXSmpsd3Jianp2bytkcnllc21sVEl4ZWk4OG5NWENVWEUr?=
 =?utf-8?B?QTBSVjdvaWJneFc3OEJxNVk0Rjd0UXliQWpxMzQ4V2x6QVJzNTFvdlZyYnlh?=
 =?utf-8?B?RlppUDdDUXRoc2YyUjVvblVnUnl6eWZlSXhlTjJYMjdOTzlSdjRoWHBhd0dY?=
 =?utf-8?B?SE44WmZ6V1JxSm9rTGJkV0RzK3NZNGxUZFk2dmZ3OGt4QmFsT1Nta2IrTFhM?=
 =?utf-8?B?dXVDdnFWLzMrT1ZIeEtCZ1kwREhZMThDMTgveVBMdUhQcTJOY1hURlNWV25h?=
 =?utf-8?B?cEZvRkU3Qk9kV0hOYURLOWN0ZS9Md2E2dFZLcHZPdWl1VkxlRmhxZ29aZVZV?=
 =?utf-8?B?MVV0ek5DRGw5ME9VMTFrazV2WUVacXRrZm9VcFk4NzhTNkUxcjdJb1NHbUdP?=
 =?utf-8?B?M00xV0xPSW9TT0phZ3Yvczk5UDUrUUhTY0ErRVNyRkVoVmpWYnphN3NDcEVi?=
 =?utf-8?B?N0FJbW1aTW9GUTBEMHFWdG5sQkNOL2ZacFdsK1drdUhoUFI3YXBIRVZpWjk5?=
 =?utf-8?B?V0JVZjQ4T3I0dS9Dc2dRSlBWMVc5KzFWT0Y4R2dmV05SU2luWjV4bENGWHZQ?=
 =?utf-8?B?SU5OdlM3NmtvRjZaVnZ6ZFd2S1pMZ21OSWxzTFhYWUNFa29tV21LNkxoR0Q2?=
 =?utf-8?B?UldMVE50WWVSd0dSU1lSRmJFVWlwdEh1bStkOVNLQzNTQWVHc3hwRC9IS0RQ?=
 =?utf-8?B?bGFIb0xjcFZiekJXdVJVV1gyd24rTXlBalZJWkxEOUgzeGhoVFBtT2NnaTN6?=
 =?utf-8?B?VEhaazUyOXltUGZldUV3QS9vcG1lOFFXWEg4K0xtTGh0WUxyaWNka1gzam9H?=
 =?utf-8?B?N29hOStvRDIwWUIxeCtJYVlvTEIwSUNJUlJ2ZFN2RGREQm5Hd243aGVZZjZx?=
 =?utf-8?B?TFZtVmlybkRUbzNGYzcwdlg2Vk1tam5aQXJJbUFSVnRURVZ2Qlg1K0FIUmh4?=
 =?utf-8?B?RnFuVjYxTmM4a1o0MTFJSnl0U1paamlpNEZPR3RBU0lEc2VDSm5DU2lxdE9Z?=
 =?utf-8?Q?8dwNyuD4PPNmrQQnPlKGJdWS1oxeR8dF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ai92eU4xVXhLY1BqMXQ5TmJiTGk1U01yTU0wbm9DZ0VKeVRSYkJUM0phUXVN?=
 =?utf-8?B?Z0dJM0VuS2JKUndJWWZ6RWh2eWhvOG9MVHkxaFJJVEhINUcvZUtLK0dvR2sr?=
 =?utf-8?B?MEcxRmtVUVRuM1VHOWlKRVg2c0tUbHFpa3BzTFphZ1pZL05FdmFtSytCbVly?=
 =?utf-8?B?TW96dFc3Zklta1llZ2NqVm1PUGh6c0NYVm5NNmVDcm1yR2xQYzBiZkU4ZHMy?=
 =?utf-8?B?c2dwN2pFUjdOekZFTU5IQVdVSEY0Sy9qWHFxUVVMakZuOWVXaTkzV3dKd2w3?=
 =?utf-8?B?WGxubFArSUIrSVFYY2toSnBrdEJhNVBEQkg4OVo4eWVjZ25WMXVGTVJYVkRP?=
 =?utf-8?B?a2NWSUpiQ2lIeHpQN2lsM0piQ0txMUNKZzJmNkJwY0J0SThDVkoxZENFTVJt?=
 =?utf-8?B?T3VVRTRIWFV2dEQwUll5S1NGdjRBNUlIdXpYSHBlRU5hcWxCejV4ZTJVbHVm?=
 =?utf-8?B?bjNBMUY2TytabmJHRnpMYWZLNkNHVFAxTmtCOWNXOGFBOXpaY2dpdHUwVmxN?=
 =?utf-8?B?VzJWN0ZHUTlya2MvVk5KaHVtOURvbVRqTStYVjl5SWwyN05HM09EdjQ5K29W?=
 =?utf-8?B?SmRheloySkpBTmQ3Z0xKcThLSlE1Z3hqTDRKa0FlUkhqUW5OcmlNa1RpQm5K?=
 =?utf-8?B?T1V0R2FVTStobmVnUDBYbTN4dkd4N0pUdEsvSFJZVE1lZlFCVjFCeWZrc1lR?=
 =?utf-8?B?WXBVSGlLSzdpZmNRRjBIcTljTkh4eHVLeCtCaGM5ai8xSjFXWmoyM2lqS0tI?=
 =?utf-8?B?RTlVaDFrQzFBTTlieFdpbGJCR255aE9yRW5RSzdnaGJobG5xOHFmWjNLM1V0?=
 =?utf-8?B?enRoYXlsWkpSaW9najRnazNucU1nNzVEME5VSk5Jc0pzL0FPaU9mZXRXdFNq?=
 =?utf-8?B?RTBYb2RZdFdMeE1lRnV5Y3pmMVZyUEJDRjZkWWdLQ2M3RzFYS0R1ZUpscGw3?=
 =?utf-8?B?SXlZUUMwUnpKdDM0UlBra3ZqaEIyYzJKZi9UN0VSK2QzZ2pWMGFyeXVFMmlO?=
 =?utf-8?B?NS9RQndRTUNRTnhjQUg2ZEJPbTFZU0tNSGFkMThVamhGNzNQSEtWWXVDMklz?=
 =?utf-8?B?aGZvdWZReXR5UlZTWkw0ODVISzFGSCtvaTNsSGhNOFBCd2U1MzlEc1l1THBI?=
 =?utf-8?B?VWdaNHdCdlRMRmoxSG5pbXVQUlc3aTIyTU56V0VqUm5HL3U5NUl2Ymp0UXFI?=
 =?utf-8?B?UnVtS1g0cmZrMHZYOE0zQXNrTEMwTnFrcmlBR1NOQTVyd0FmNWY2VExkeFMz?=
 =?utf-8?B?a1QvbkpXU05idHVrVlFET1RrWS9sREorK1d5eDJsTlRtR1BmcE9YQXR6bFNs?=
 =?utf-8?B?ckVCMm5BM3ZJU05TYlczWmtuZmxWRERiNFdveTBNendxdHMxQTJTY1psZ0ta?=
 =?utf-8?B?MDYvTjhVVFAyUmZvNVNNRzR6bXRhRGEyc0lNMjR1TjFLalQycDN4VVg3cjRp?=
 =?utf-8?B?eWtGUmM1Z2NFVEd6eCs1QklIQ280UHUvcm80Mk45N01OSWNFVHRTVjJ3NDZ1?=
 =?utf-8?B?NGpaVVdTZ1VMVEF3aWhWSk43WEpwOHdxNlJwK0NCN0pBQ25iSitoM3BheGZ3?=
 =?utf-8?B?THpVQWFNVHlFSVc3TDF5NzhxSzBsUVNaemhtSFVYWW9rY3h6OGpmTG5McTJm?=
 =?utf-8?B?dzcwQzVoN3ZxdnB0UjVuK1dtTUMwTHp4MXdPVHpLNnIxQlgyZGlwejNMZURO?=
 =?utf-8?B?ckNRR1R4Q1RDRU5JQTcxOGVIUmpxM3BEQU41bHp3S09QeXArTm9iZWZNc0hh?=
 =?utf-8?B?ZklseXVjbXQ4SzhQUVpQd1pqaktkeDZ3bElWUW41bDQ0MUNyeDBLeDVOSXJQ?=
 =?utf-8?B?eFkvMmJBd2x1Q2FYUnV2R3U3NmpWdjJaV2tNSkYxS3JxWGtlbndJcHYveko3?=
 =?utf-8?B?LzdqQmE4ZE16NzlNVU1nZGM5aVBGWDVBaUl3RWNCMUEvNUlwRzNIbnFRa0RR?=
 =?utf-8?B?MlNMMEtmUTk0ellhcG5WNjAvUHYzVy9vWG5FUGhlQVFoNjV3N3dvajUra1Y4?=
 =?utf-8?B?ckRnUncxSXZ6bCtWcUpqblF3bFI5Y3VEb2NpcTNUVkdCQUpBOSttUHhaTGtJ?=
 =?utf-8?B?eWhuQWY0UFFDKzNLaVF3b1ZUK1VQbGJlMUtnTjQ3TE5pazNlZ3pPbi9wUVJI?=
 =?utf-8?B?aTlTek1hVEhMV241cDJaVnFyYVE3WC9Pc3FUS2RzNE1OYTZwVHh1NmJOV0hG?=
 =?utf-8?Q?T/rS/mCYfJJ4zvDjQK2roJsZUS1icHN95ikJt5kclKef?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2e5b10-ed01-4df2-f4f5-08dd71d0a00e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 10:25:00.8748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5HoJwbpZHzrY9bVdpLtsl9slgdOyXXoK1uOeDzpXLGO1b66c/kkFx+Lc09UE8vkOwCawIR8QxdkmH4ktcx8wqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6055

DQo+IEZyb206IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIEFwcmlsIDIsIDIwMjUgMjo1MyBQTQ0KPiANCj4gT24gVHVlLCBBcHIgMDEgMjAyNSwg
TWF0aWFzIEV6ZXF1aWVsIFZhcmEgTGFyc2VuIDxtdmFyYWxhckByZWRoYXQuY29tPg0KPiB3cm90
ZToNCj4gDQo+ID4gQmFja3BvcnQgY29tbWl0cyBmcm9tIDEuNCBicmFuY2ggaW50byAxLjMgaW4g
cHJlcGFyYXRpb24gZm9yIHJlbGVhc2luZw0KPiA+IHYxLjMuDQo+ID4NCj4gPiBIYWl4dSBDdWkg
KDEpOg0KPiA+ICAgY29udGVudDogUmVuYW1lIFNQSSBtYXN0ZXIgdG8gU1BJIGNvbnRyb2xsZXIN
Cj4gPg0KPiA+IE1hcnRpbiBLcsO2bmluZyAoMSk6DQo+ID4gICB2aXJ0aW9fcGNpX2NhcDY0OiBz
cGVjaWZ5IG9mZnNldF9oaSwgbGVuZ3RoX2hpIGVuZGlhbm5lc3MNCj4gPg0KPiA+IFBhb2xvIEFi
ZW5pICgyKToNCj4gPiAgIHZpcnRpby1uZXQ6IGNsYXJpZnkgTkVFRFNfQ1NVTSBzZW1hbnRpYyBm
b3IgR1NPIHBhY2thdHMuDQo+ID4gICB2aXJ0aW8tbmV0OiBjbGFyaWZ5IERBVEFfVkFMSUQgc2Vt
YW50aWMgZm9yIGVuY2FwIHByb3Rvcy4NCj4gPg0KPiA+IFBhcmF2IFBhbmRpdCAoOCk6DQo+ID4g
ICBjb25mb3JtYW5jZTogQWRkIG1pc3NpbmcgdmlydHF1ZXVlIHJlc2V0IGNvbmZvcm1hbmNlIHJl
ZmVyZW5jZXMNCj4gPiAgIHBhY2tlZC1yaW5nOiBDaGFuZ2UgaG9zdCxndWVzdCB0byBkZXZpY2Us
ZHJpdmVyDQo+ID4gICBkZXNjcmlwdGlvbjogQXZvaWQgc3BsaXR0aW5nIHRoZSB3b3JkIHZpcnRx
dWV1ZQ0KPiA+ICAgdmlydGlvLWJsazogRml4IGRhdGEgdHlwZSBvZiBudW1fcXVldWVzIGZpZWxk
DQo+ID4gICB2aXJ0aW8tbmV0OiBGaXggcmVjZWl2ZSBidWZmZXIgc2l6ZSBjYWxjdWxhdGlvbiB0
ZXh0DQo+ID4gICB2aXJ0aW8tbmV0OiBDbGFyaWZ5IHRoZSBzaXplIG9mIHRoZSBzdHJ1Y3Qgdmly
dGlvX25ldF9oZHIgZm9yIHR4DQo+ID4gICB2aXJ0aW8tbmV0OiBBbm5vdGF0ZSB2aXJ0aW9fbmV0
X2hkciBhcyBmaWVsZA0KPiA+ICAgZ3B1OiBlZGl0b3JpYWw6IEZpeCBzcGVsbGluZyBlcnJvcnMN
Cj4gPg0KPiA+IFN0ZWZmZW4gVHJ1bXRyYXIgKDEpOg0KPiA+ICAgdmlydGlvLW5ldDogRml4IHJl
Y2VpdmUgYnVmZmVyIHNpemUgdHlwbw0KPiA+DQo+ID4gIGNvbmZvcm1hbmNlLnRleCAgICAgICAg
ICAgICAgICAgIHwgIDIgKysNCj4gPiAgY29udGVudC50ZXggICAgICAgICAgICAgICAgICAgICAg
fCAgMiArLQ0KPiA+ICBkZXZpY2UtdHlwZXMvYmxrL2Rlc2NyaXB0aW9uLnRleCB8ICAyICstDQo+
ID4gZGV2aWNlLXR5cGVzL2dwdS9kZXNjcmlwdGlvbi50ZXggfCAgNiArKy0tDQo+ID4gZGV2aWNl
LXR5cGVzL25ldC9kZXNjcmlwdGlvbi50ZXggfCA1MiArKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLQ0KPiA+ICBwYWNrZWQtcmluZy50ZXggICAgICAgICAgICAgICAgICB8ICA0ICstLQ0K
PiA+ICB0cmFuc3BvcnQtcGNpLnRleCAgICAgICAgICAgICAgICB8ICA0ICstLQ0KPiA+ICA3IGZp
bGVzIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4N
Cj4gPiBiYXNlLWNvbW1pdDogYjQ5NTg0MWE4ZTgwZDEyYzExMzBmODg2OGY0MTI4ODY2MjkxMTQy
ZA0KPiANCj4gTG9va3MgZ29vZCB0byBtZS4NCg0KSSBkaWQgZHJ5IHJ1biBhbmQgd2FzIGFibGUg
dG8gbWVyZ2UgdGhlbSB0byBtYXN0ZXIgc3VjY2Vzc2Z1bGx5IHdpdGggcGRmIGRpZmYgdG9vLg0K
RG8gd2UgbmVlZCBhIHZvdGUgZm9yIGl0IG9yIGJlY2F1c2UgdGhlc2UgY2hhbmdlcyBhcmUgYWxy
ZWFkeSB2b3RlZCBzb21ld2hlcmUgZWxzZSBvciB0aGV5IGFyZSBlZGl0b3JpYWwsIGNhbiBJIG1l
cmdlIHRoZSBjaGFuZ2VzIG5vdz8NCg0K
