Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22BC849C
	for <virtio-comment@lists.linux.dev>; Fri, 28 Mar 2025 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175828; cv=fail; b=lHfp9BcGdoX85usxYfxWewisx7dvkR/6oFKyZbjRdy8wyoTxYu1tewW1My525bzrEuBdY4SkhgWsdiymjhAou5rRaKl0jAdvfdWj+44a5E8HGKVOcOO9H2laJLfwx25knfyuqGVR0fnqFJI0sjdcxofYPpFqQwtBLVPPCxLVPsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175828; c=relaxed/simple;
	bh=hgp2mZYeXmq60uMcuDzU2Pc6zxeAP3LNhdrSUQW7t3c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eLm70flQeerrt5IHshcA1qxbeE/b5HnQTXqNJtDJGiJQjUr/OEDu6QAcCZLdYZYppXspm95ammzeu8VDlNRDelEvY4YzlWkV7OigNHHkPn7IuciAJ6rfu/Y3OcaoC1Xee+WJlSrG6Xp6wG53XG7JNyMs4tMbs/YhHta+OkFSfmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O4yKwTP6; arc=fail smtp.client-ip=40.107.93.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O4yKwTP6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZ+AALmhqs53lq4f0oXOkkig5H6VaYO+mEhlKSpvxVsB8r+ZiK2xuBHY49CTIgtUXmq9meEGyJFVL14bLlTIpkLm1dSRT7QEIySNQfMi83fSBSN3zpItg8y9dlM0UoiiiC1dJasVyVw8drKKQSldKPBO+WV9pA4v2beQaWeK13jG1UQenIxoq84ea+Vy3bA3zPpy/w7IYvoISm4xYB1AB1jEhzkyUZp5HpyJ2baaM8AfEw8wIA+sISf7ReDi8Vu7y4Y/scrZkvLPdb/+cOFaqtRBrfx/vOL3HDMiTeU0b796wpZe9xUODoCzZ96JGFygcXade8y+yxAtc9WJJRviJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgp2mZYeXmq60uMcuDzU2Pc6zxeAP3LNhdrSUQW7t3c=;
 b=XnYGcGNlzny6yO4VSR+7KuEIZD+5mSomSAJlgqjBx3dMaX8ZhGOQfzrg0CsyKr1mfTq/Cjq9koptT1/uKP+2wJNcVwRpEqQX8enqWIr47ZP3wjDnSKWLGtCqcRii9dXjq+rXONObP5mSvEmh6VZonRzS/Slo1VN6t18TXDt9lnSPbnRf9A9O+T8A3gLjGw1XwBBMGMbvJ2eiBzz+iOEniz8F+IMoIHnUBhaY0e27w1Brfjx7XsXmKAje3Ieb3sN8eLVHULlN/1/ZMiTX36I7a1rLZIY6hnZ9PSIc9o9AouQUxjTG6hU/epT0z5xICL/UHemYNTH0RccNHomNW5of2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgp2mZYeXmq60uMcuDzU2Pc6zxeAP3LNhdrSUQW7t3c=;
 b=O4yKwTP6HOI/gmTlAHnRKlckUV4HzGRDr/uDXA+sMu8cnLctrtylvYpvsUM8HG6yK4x/+Rg3WgBWyI0cLDz53O99RTwsQ8jdBm8O+2lIomhZfSRNr9m14u4TYxnIROv45ZkMlyKR0bihebCR+Pa44uznnxWpP55fBQjkGuS/YUGh4fdi4WtEGHygnAOQaywMfCvw+J3LIen44SXIS8nKLRSNVCBH8fIrZuWa5B6YZvIYH7k+B19onMetIqbztvdcl1z6cYKCDu5bNCs39FlDbMvc+nLqsdWYgcnFU487zGdIhOv3unR2aq/VEMMTisnZAy2/KevI1dxBRYQVy3K8DQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA0PR12MB8280.namprd12.prod.outlook.com (2603:10b6:208:3df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 15:30:20 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 15:30:20 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, Satananda
 Burla <sburla@marvell.com>, Nithin Kumar Dabilpuram
	<ndabilpuram@marvell.com>, Jerin Jacob <jerinj@marvell.com>
Subject: RE: [PATCH RFC v2 2/4] virtio-net: Add new flow filter selector and
 action for IPsec
Thread-Topic: [PATCH RFC v2 2/4] virtio-net: Add new flow filter selector and
 action for IPsec
Thread-Index: AQHbbJX0GSTeR6NQgEGSssKIK9F9y7NCnF2ggEL0VACAA4EdIA==
Date: Fri, 28 Mar 2025 15:30:20 +0000
Message-ID:
 <CY8PR12MB7195FF0B9986A0A7A1CB616EDCA02@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250122062144.266725-1-schalla@marvell.com>
 <20250122062144.266725-3-schalla@marvell.com>
 <CY8PR12MB7195A7DF812EB2E46932BF68DCFD2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <DS0PR18MB53683B7F3C7B546C3E17748DA0A62@DS0PR18MB5368.namprd18.prod.outlook.com>
In-Reply-To:
 <DS0PR18MB53683B7F3C7B546C3E17748DA0A62@DS0PR18MB5368.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA0PR12MB8280:EE_
x-ms-office365-filtering-correlation-id: 701f3e8b-1703-475f-08c5-08dd6e0d731e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bUJEYlZYa2Z4VTV3ckkyN3ZQeGl1YWMrTXoxdVByNzlPQVozcFF1Z0EzT2M4?=
 =?utf-8?B?Z0tXT0RvS3FuSU5PYlNXSFFkeVVVRnRvY1BXcXFDeWdXR240S2NaaERaSGoz?=
 =?utf-8?B?blR4ZmJodEs4ang1TSt0UmF2NVpMSUN0aXZ3S3o5TVBya21Ma29wL2tQZkNT?=
 =?utf-8?B?NjdZclBIY1RkNUVkams5RllVakl5SGNaOFRjRWwyc3VLb0FSWHE3TU5xdzVE?=
 =?utf-8?B?UWhxMUhNcDZ4SjFUMUpRV1hvUGd1bVRzRTh3N1ZXYncvcmNJSTVsaVdNMzNl?=
 =?utf-8?B?cWVrbDZiZTFzMzZqNWhkdEJPNlpKQTEzd3c5MVZzTjQrSkxHZ3BxWk01RXlz?=
 =?utf-8?B?NWYwNVJGWmR5L25xd1dPOTI1T2gxY1JlUVlhS1NBQlZsWHJxbnppNnFtdUVh?=
 =?utf-8?B?dFcwSUNzeHRhTjJDNnB3eDNZOFloc2VxMXh5UnpkNEphQkphbzg3RFhQenNr?=
 =?utf-8?B?aUE2aS9sQ05kbGllNmJyNmhxVmo3R29TUitzejYrZjZTUXA4N3FwUkpQbVU2?=
 =?utf-8?B?WkdZcVEwVmZ6MjVVQ0F1MlAwR1FrQlFIcXVqYmVGQkV4b3VaMUFhdnI5emg2?=
 =?utf-8?B?ZXRDeDFTMjcxczdONUZUZk1tdEljMm5DRjJ6d3RwK1hONjN0RllpK2dUQXNW?=
 =?utf-8?B?Sm9NcythYml2RHAwbWtkYkdaWW1sSlFOYlEvd3UwQjhpUmhlanV6VmZoMnZM?=
 =?utf-8?B?RWFuNVE3ZStDVVJqb2trTTNjYXJCajFsbXdRbTBJaHZCQ1VsQVJ6UVRqWWRy?=
 =?utf-8?B?VGNvZmc0czJ3TlZSOVF3dUJrb3RwbllsTVVBMXI0Wk1VSTdsL2d3VXhKM1BU?=
 =?utf-8?B?OUdia3ozcXVmZWtWaUczRXhMamNsYXBFbDBwNElETmlNWXFsY2RLeU9uMHYy?=
 =?utf-8?B?VUk1SWgrWXBsd3ZjeCt1ZDNaWUFXNmFVWFJ2Vy9LSWp5TEI3MFdLUXNUY3VZ?=
 =?utf-8?B?Y052YXRyUkhzS1IyQ3QvbC9URUdSZHlzVnJaTkxyVUcwM0NZc0c3UEs5NDhJ?=
 =?utf-8?B?N1FvZDMzaW1VeER5T3YyaDMzcmJmTFRMWW1VMys4T3dyWW5GVzRpREhCNUhv?=
 =?utf-8?B?WVdZVnMwWTZ2RlR4N3hUY3dzemgvRFgxWmlKTE1qOExNb1BkZ2tjbGVSMGNn?=
 =?utf-8?B?ajBEc3I5aFRycFFqdnZhUTNneWlWMHVWM0xZelBQV3hoUmFESk9XTTh1MlNF?=
 =?utf-8?B?aVFXc3I0a3VlT3JJWHlaUHBMK2JNK0hZNElUWHlVeWVKMEUvWlArblo2OVQ1?=
 =?utf-8?B?ekVkS3FsQkNhQll5T3BDcmIwTWRiTXJUSmlmY2hlUytYcUVIV3BLRjl2dEND?=
 =?utf-8?B?TnYzeXhpODIxRFpJV1NteXJrb1RnSG52M21Cam1hdjNRZm8yTHFWbkUyMmNG?=
 =?utf-8?B?dmxPU2M2RTlqTHduVitqWDRVYU1OeU96MUY2UTNnMzFWK3kveEIvMVFIZExB?=
 =?utf-8?B?VWpOdVMxL2NaNmRoa0V2bkNmMjF1S0lnN3FTQ1NXd25rNkdxMnZhKzhVcTBV?=
 =?utf-8?B?TytvTVFXVmtlZ3hiTlJrSFI3cTBRRmczay93SitrT1dWemVUTnlWeVJ6eFoz?=
 =?utf-8?B?bWhWY1ArUHN2Uzc2RFkrcGhrYy91NDJUVG5ZcnBTYlJlaS95bDB4TmFjYk9K?=
 =?utf-8?B?UGJvN0pjWCsxLzNEMVRoT01uMEZvRlVHMEdIT0EvYW14WGtYMlNJQmZrS1Er?=
 =?utf-8?B?YzMzMzhSRmpqZHU0bnF1ZzYrS2dNL21RNzBXeWZiNm54bEtlaUQ5UElqYVRs?=
 =?utf-8?B?cDBhY1h0YWprWHdjeVRua0pDWFh1Z00vZFBHS25sZmpSWFhPdGUrd1hNTnZX?=
 =?utf-8?B?RGVzVmphVjVhV2Z6Zlc1NGVJNDBBQUIrMGZ4elJLZTJtUjVPdDV4dkNBYVo3?=
 =?utf-8?B?RTVXUGtPUDJFMWpEdkNPKzRPWWNpTXYyWTlGZ3hrbWo1bEpwajlEUDFna0Rr?=
 =?utf-8?Q?QWgi8eJjVz7WfewNyzS1uepG0iAFOh/c?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzFrV0RWWU1qbkZmNm9UZityRVdBaWllMnpYb3FjZlFncDRrMUFjVGF1N21W?=
 =?utf-8?B?NGY5TmRrNzZNbm9CTWMvRHJOYi8zOXpyTGRiRTRvYncrb2NKL1lZN0Y1bTEw?=
 =?utf-8?B?Qk9WYUJpR3B4OHdkMk1mNE5vQ1dwSk5tOW9CNThLV1JkL0VCaE9iUHpYVmJX?=
 =?utf-8?B?YnJLUjFzSkxVbHJTSitScjAvSlVhYjR3eDhIaEE0eU50Ny9JRjhnK21SWW1I?=
 =?utf-8?B?N1NoeGpiVmtlVG9Qd2w2T3hnZXNXSTNKUC9neEl4SUVkU3ZPS0xqdmxHa0xC?=
 =?utf-8?B?eGR5aGZ1WE1oRXdZWjR3bGZqaEVEUlV5dEE5SXAzOWFFNG9SWEpXaXY3Sjlo?=
 =?utf-8?B?ZU1VdVlEdW9Wb1hmRmc1S0dGaFlUdytXcEswTGdCdHRoa3ZvdWZXWWQzam5S?=
 =?utf-8?B?UFJvQk9VK0kvS1M1UlduTjNaOFBYa0xJTVNtRlhEZnRhZW5QUTZrakRib3Ju?=
 =?utf-8?B?Ri9CWUJBU1NYWWtBWHhLZHRNbFRNNWJQc3ovODQ2N2kwUmZKd2lZaVZ3eTN2?=
 =?utf-8?B?eXhFVkhLRXJkR3Z1NmgxZGlwL1IwQU5ob1BEdkVwTjJHOFdSWTIwSk5kSU9q?=
 =?utf-8?B?RFlncURoOWtYMXVUU1VMRGE0ekpIZzR3YU1heGVwaDg3OFBqZDVNdVBxU0tn?=
 =?utf-8?B?K1JUeE5MZ1N2YVdaSktLUXVUdmVWQWo1WjJ4UjEwVjZZZ2RkRUpXVHFJbmlQ?=
 =?utf-8?B?TFRxMkZUZnhKcTVpZm1IQ1pVOE13UXJ4dGplaUIvWURKM0RkT0V0dmpFY09h?=
 =?utf-8?B?ZXczQUdvNGw1TlA3Qi90MThIRGowWG9yNS95SU9aQmNRTlBxQ056OFJHMjdk?=
 =?utf-8?B?Z3pkcjY0Z3pIdWN2N0lZQUJ6UXFyeUR1Q0RDYlY0SkdidWl2RDVIWGdBY2Jm?=
 =?utf-8?B?S1ZzMlp3aUUxdkNkcGVwdG1HYkd4bTR1c3JEMU1vY3VndSs5ZG1IdmYxem84?=
 =?utf-8?B?TW9DUW1zZXJPZjJwN2xjQzJSVUM3Uyt6QnVVVTZYNUtiNTA5VWVvSWh3dnBO?=
 =?utf-8?B?K29wbzNTMEgzSG50RG1RSmFtWTg0OUNqc296WVRzWjhYM3pZRXlXeVpmVk00?=
 =?utf-8?B?NklVSFV5MXV6UmVUc0RxSUN1VWhxMDM1K3lNSHhlY3lIM2EyTmwxYlhsK2Jx?=
 =?utf-8?B?VDNxRG9OcktBRGpHZE1ic1pHcXFtcHVYWUN4a3dmSnVCbGlLVDFQTENJaWph?=
 =?utf-8?B?bDNhUnB6QXlmenNqQndmZDJwYVQwcDBDb2VuY1o5ZGpzallpN1dWUUxoejdQ?=
 =?utf-8?B?OVJUWlFpcmFOL1FuYUsrbVhxYlhhVWRKUEMrNSsxYzI5YnZYN3pEOWlHSEFC?=
 =?utf-8?B?dDFNOGhGYndOb2tYejJzSUYyMFJiNUJjUDhPTW8yWGlGdlUrMlVoVHdhc2ZF?=
 =?utf-8?B?b2c3ZS9aVWtrSmpRTXVGb2ZMY3liaUUvZ0xLblp3MytPSC9UcDY3Wm9wMm02?=
 =?utf-8?B?RFZ5TnB5dlNWR1dyQjErcmF2eXMxUlVpRUlaOWw5Z2JpajdLWFpwNFJuTDdz?=
 =?utf-8?B?aWxBMS9MeWh0WGU1MmVlMWNzcUphekJQdU9kRy9mNndZY1hqemR6Q3c4ckFo?=
 =?utf-8?B?dkU4a3FpT0c4NVc2alZManF2UmlDL2NhRUhiYndNUmZQcDROZHVmSklnQjlm?=
 =?utf-8?B?QTJiYjdPWi8wcnFHUTgxYmVnV0hwNklXRW5qK3VGakZjeU9BN0F6ZWx2SmVB?=
 =?utf-8?B?L3IxZXV3cjFKQURvTjlBcHVJNXRpeHkxYThkK015M3FWZ2ZCbitGeTBtYnR6?=
 =?utf-8?B?UHR4WEIzL21ISmdRVUxUZFVDQVczaXZnYkl5TGhCVFRTQ1V1TTZYV25rSWdt?=
 =?utf-8?B?VlFDM0I5dmpDL3NhSGFRVHVPUmpmZzF3UVZzWFhhODlPSG1sUWhoWG14QjJy?=
 =?utf-8?B?anJXUmcyOHUzZkc0VFVqaHNMMC94eWhqRzZPeDBydnpNZmhMb1EzVCt0L3pD?=
 =?utf-8?B?MWFzU1NUZyt1d0FycE5aQ3QxVmhyT1YxMXJXUDdQcUNveE0xeXJCaDJtSERP?=
 =?utf-8?B?WndoTk1qU01lZHFQRkYwaHF1c0hkaXQ2b2pKVFp6V0FsOUo4VUhta2txMjJy?=
 =?utf-8?B?Ly8xRm5iL1ZkeHhmRkw3TW1FZVF2b3ZNN3JqQ0JLOGgyUVlzVXNKMGpnV2lL?=
 =?utf-8?B?dFRNSGpzZU1uWVNxRjI4TWc2TmU3MzdFUXhMWFRsMExEbmNQUnJjVkhkV1do?=
 =?utf-8?Q?lq8nQCmikOy+JwrIhgYG9Bk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 701f3e8b-1703-475f-08c5-08dd6e0d731e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 15:30:20.1421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S6S3q3qokH5x+UG2b4YENDy2wXITpFML23UiQ6eyDCkjsD3fS/LuMoCNTjYtsqMSaxMmIf48mY33JwMPdDwzDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8280

DQo+IEZyb206IFNydWphbmEgQ2hhbGxhIDxzY2hhbGxhQG1hcnZlbGwuY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIE1hcmNoIDI2LCAyMDI1IDM6MjQgUE0NCj4gDQo+ICA+ID4gRnJvbTogU3J1amFu
YSBDaGFsbGEgPHNjaGFsbGFAbWFydmVsbC5jb20+DQo+ID4gPiBTZW50OiBXZWRuZXNkYXksIEph
bnVhcnkgMjIsIDIwMjUgMTE6NTIgQU0NCj4gPiA+DQo+ID4gPiBUaGlzIHVwZGF0ZSBpbnRyb2R1
Y2VzIGEgbmV3IGZsb3cgZmlsdGVyIHNlbGVjdG9yIHRvIG1hdGNoIHRoZSBFU1ANCj4gPiA+IGhl
YWRlciBhbmQgYWRkcyBhIG5ldyBmbG93IGZpbHRlciBhY3Rpb24gZm9yIElQc2VjIHByb2Nlc3Np
bmcuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogU3J1amFuYSBDaGFsbGEgPHNjaGFsbGFA
bWFydmVsbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBkZXZpY2UtdHlwZXMvbmV0L2Rlc2NyaXB0
aW9uLnRleCB8IDIzICsrKysrKysrKysrKysrKysrKysrLS0tDQo+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDIwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAt
LWdpdCBhL2RldmljZS10eXBlcy9uZXQvZGVzY3JpcHRpb24udGV4IGIvZGV2aWNlLQ0KPiA+ID4g
dHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleCBpbmRleCAwMjBkMDkwLi5jZWYxMDlkIDEwMDY0NA0K
PiA+ID4gLS0tIGEvZGV2aWNlLXR5cGVzL25ldC9kZXNjcmlwdGlvbi50ZXgNCj4gPiA+ICsrKyBi
L2RldmljZS10eXBlcy9uZXQvZGVzY3JpcHRpb24udGV4DQo+ID4gPiBAQCAtMjYzNCw3ICsyNjM0
LDkgQEAgXHN1YnN1YnNlY3Rpb257RmxvdyBmaWx0ZXJ9XGxhYmVse3NlYzpEZXZpY2UNCj4gPiA+
IFR5cGVzIC8gTmV0d29yayBEZXZpY2UgLyBEZXZpY2UgT3BlICBcaGxpbmUNCj4gPiA+ICAweDUg
JiBWSVJUSU9fTkVUX0ZGX01BU0tfVFlQRV9VRFAgJiA4IGJ5dGVzIG9mIFVEUCBoZWFkZXINCj4g
PiBkZXNjcmliZWQNCj4gPiA+IGluIFxoeXBlcnJlZltpbnRybzpVRFBde1VEUH0gXFwgIFxobGlu
ZQ0KPiA+ID4gLTB4NiAtIDB4RkYgJiAmIFJlc2VydmVkIGZvciBmdXR1cmUgXFwNCj4gPiA+ICsw
eDYgJiBWSVJUSU9fTkVUX0ZGX01BU0tfVFlQRV9FU1AgJiA4IGJ5dGVzIG9mIEVTUCBoZWFkZXIg
XFwgXGhsaW5lDQo+ID4gPiArMHg3IC0gMHhGRiAmICYgUmVzZXJ2ZWQgZm9yIGZ1dHVyZSBcXA0K
PiA+ID4gIFxobGluZQ0KPiA+ID4gIFxlbmR7dGFidWxhcnh9DQo+ID4gPiAgXGVuZHt0YWJsZX0N
Cj4gPiA+IEBAIC0yNjk0LDcgKzI2OTYsMTEgQEAgXHN1YnN1YnNlY3Rpb257RmxvdyBmaWx0ZXJ9
XGxhYmVse3NlYzpEZXZpY2UNCj4gPiA+IFR5cGVzIC8gTmV0d29yayBEZXZpY2UgLyBEZXZpY2Ug
T3BlICBcaGxpbmUNCj4gPiA+ICAweDIgJiBWSVJUSU9fTkVUX0ZGX0FDVElPTl9ESVJFQ1RfUlhf
VlEgJiBNYXRjaGluZyBwYWNrZXQgd2lsbCBiZQ0KPiA+ID4gZGlyZWN0ZWQgdG8gYSByZWNlaXZl
IHF1ZXVlIFxcICBcaGxpbmUNCj4gPiA+IC0weDMgLSAweEZGICYgJiBSZXNlcnZlZCBmb3IgZnV0
dXJlIFxcDQo+ID4gPiArMHgzICYgVklSVElPX05FVF9GRl9BQ1RJT05fSVBTRUMgJiBNYXRjaGlu
ZyBwYWNrZXQgd2lsbCB1bmRlcmdvDQo+ID4gSVBzZWMNCj4gPiA+ICtwcm9jZXNzaW5nIFxcIFxo
bGluZQ0KPiA+ID4gKzB4NCAmIFZJUlRJT19ORVRfRkZfQUNUSU9OX0lQU0VDX1JFQ0lSQ1VMQVRF
ICYgTWF0Y2hpbmcgcGFja2V0DQo+ID4gd2lsbA0KPiA+ID4gK2ZpcnN0IHVuZGVyZ28gSVBzZWMg
cHJvY2Vzc2luZywgZm9sbG93ZWQgYnkgdGhlIGZsb3cgZmlsdGVyIHJ1bGVzDQo+ID4gPiArYWdh
aW4gXFwgXGhsaW5lDQo+ID4gPiArMHg1IC0gMHhGRiAmICYgUmVzZXJ2ZWQgZm9yIGZ1dHVyZSBc
XA0KPiA+ID4gIFxobGluZQ0KPiA+ID4gIFxlbmR7dGFidWxhcnh9DQo+ID4gPiAgXGVuZHt0YWJs
ZX0NCj4gPiA+IEBAIC0yNzQ4LDcgKzI3NTQsOCBAQCBcc3Vic3Vic2VjdGlvbntGbG93IGZpbHRl
cn1cbGFiZWx7c2VjOkRldmljZQ0KPiA+ID4gVHlwZXMgLyBOZXR3b3JrIERldmljZSAvIERldmlj
ZSBPcGUgIFRoZSBmaXJzdCBzZWxlY3RvciBpcyBhbHdheXMNCj4gPiA+IFZJUlRJT19ORVRfRkZf
TUFTS19UWVBFX0VUSC4gV2hlbiB0aGVyZSBhcmUgbXVsdGlwbGUgIHNlbGVjdG9ycywgYQ0KPiA+
ID4gc2Vjb25kIHNlbGVjdG9yIGNhbiBiZSBlaXRoZXIgVklSVElPX05FVF9GRl9NQVNLX1RZUEVf
SVBWNCAgb3INCj4gPiA+IFZJUlRJT19ORVRfRkZfTUFTS19UWVBFX0lQVjYuIElmIHRoZSB0aGly
ZCBzZWxlY3RvciBleGlzdHMsIHRoZQ0KPiA+ID4gdGhpcmQNCj4gPiA+IC0gc2VsZWN0b3IgY2Fu
IGJlIGVpdGhlciBWSVJUSU9fTkVUX0ZGX01BU0tfVFlQRV9VRFAgb3INCj4gPiA+IFZJUlRJT19O
RVRfRkZfTUFTS19UWVBFX1RDUC4NCj4gPiA+ICtzZWxlY3RvciBjYW4gYmUgb25lIG9mIFZJUlRJ
T19ORVRfRkZfTUFTS19UWVBFX1VEUCwNCj4gPiA+ICtWSVJUSU9fTkVUX0ZGX01BU0tfVFlQRV9U
Q1AgYW5kIFZJUlRJT19ORVRfRkZfTUFTS19UWVBFX0VTUC4NCj4gPiBJZiB0aGUgdGhpcmQgc2Vs
ZWN0b3IgZXhpc3RzLCBpdCBjYW4gYmUgc2V0IHRvDQo+ID4gVklSVElPX05FVF9GRl9NQVNLX1RZ
UEVfVURQLCBWSVJUSU9fTkVUX0ZGX01BU0tfVFlQRV9UQ1AsIG9yDQo+IFZJUlRJT19ORVRfRkZf
TUFTS19UWVBFX0VTUC4NCj4gPg0KPiA+IFRoaXMgcmVhZHMgYmV0dGVyIHRvIGluZGljYXRpbmcg
aXQgaXMgb25lIG9mIHRoZSBjaG9pY2VzLg0KPiA+DQo+ID4gPiAgRm9yIGV4YW1wbGUsIHRvIG1h
dGNoIGEgRXRoZXJuZXQgSVB2NiBVRFAgcGFja2V0LA0KPiA+ID4gXGZpZWxke3NlbGVjdG9yc1sw
XS50eXBlfSBpcyBzZXQgdG8gVklSVElPX05FVF9GRl9NQVNLX1RZUEVfRVRILA0KPiA+ID4gXGZp
ZWxke3NlbGVjdG9yc1sxXS50eXBlfSAgaXMgc2V0IHRvDQo+ID4gPiBWSVJUSU9fTkVUX0ZGX01B
U0tfVFlQRV9JUFY2IGFuZCBcZmllbGR7c2VsZWN0b3JzWzJdLnR5cGV9IGlzIEBAIC0NCj4gPiA+
IDMwNDYsNiArMzA1MywxNiBAQCBcc3Vic3Vic2VjdGlvbntJUHNlYyBPcGVyYXRpb259XGxhYmVs
e3NlYzpEZXZpY2UNCj4gPiA+IFR5cGVzIC8gTmV0d29yayBEZXZpY2UgLyBEZXZpY2UgIGF0dGFj
aCBJQ1YsIHVwZGF0ZS9hZGQgSVAgaGVhZGVyDQo+ID4gPiBhbmQgYWRkIEVTUC9BSCBoZWFkZXIv
dHJhaWxlciB0byB0aGUgcGFja2V0ICBhbmQgdHJhbnNtaXQuDQo+ID4gPg0KPiA+ID4gK1xwYXJh
Z3JhcGh7UGFja2V0IHByb2Nlc3Npbmcgb3JkZXJ9IFxsYWJlbHtwYXI6RGV2aWNlIFR5cGVzIC8N
Cj4gPiA+ICtOZXR3b3JrIERldmljZSAvIERldmljZSBPcGVyYXRpb24gLyBJUHNlYyBPcGVyYXRp
b24gLyBQYWNrZXQNCj4gPiA+ICtwcm9jZXNzaW5nIG9yZGVyfQ0KPiA+ID4gKw0KPiA+ID4gK0lm
IGFuIElQc2VjIGFjdGlvbiBydWxlLCBlaXRoZXIgVklSVElPX05FVF9GRl9BQ1RJT05fSVBTRUMg
b3INCj4gPiA+ICtWSVJUSU9fTkVUX0ZGX0FDVElPTl9JUFNFQ19SRUNJUkNVTEFURSwNCj4gPiA+
ICtpcyBtYXRjaGVkIGR1cmluZyBmbG93IGZpbHRlciBwcm9jZXNzaW5nLCB0aGVuIElQc2VjIHBy
b2Nlc3NpbmcgaXMNCj4gPiA+ICthcHBsaWVkIG9uDQo+ID4gPiB0aGUgcGFja2V0Lg0KPiA+IEkg
YmVsaWV2ZSBJUFNFQyBwcm9jZXNzaW5nIHNob3VsZCBiZSBsaW1pdGVkIHRvIG9ubHkgdHlwZSBB
Q1RJT05fSVBTRUMuDQo+ID4gQ2FuIHdlIGtlZXAgdGhlIF9BQ1RJT05fSVBTRUNfUkVDSVJDVUxB
VEUgdG8ganVzdA0KPiBfQUNUSU9OX1JFQ0lSQ1VMQVRFPw0KPiA+IE1heSBiZSBvbmUgd2lsbCBi
ZSBhYmxlIHRvIHVzZSB0aGUgZ2VuZXJpYyByZWNpcmN1bGF0ZSBhY3Rpb24gZm9yDQo+ID4gbWFj
c2VjIG9yIHNvbWUgb3RoZXIgZGVjYXAgb3BlcmF0aW9uIHRvby4NCj4gSSB0aGluayBjaGFpbmlu
ZyBvZiB0aGUgYWN0aW9ucyBpcyByZXF1aXJlZCBpZiB3ZSBtYWtlIElQU0VDIGFuZCBSRUNJUkNV
TEFURQ0KPiBhcyBzZXBhcmF0ZSBhY3Rpb25zIGFuZCBjdXJyZW50IHNwZWMgZG9lc24ndCBzdXBw
b3J0IHRoZSBjaGFpbmluZy4NClRoZSByZWNpcmN1bGF0ZSBvcGVyYXRpb24gaXMgZG9pbmcgbW9y
ZSB0aGFuIG9uZSBhY3Rpb24gYW55d2F5IG9uZSBhZnRlciB0aGUgb3RoZXIuDQpTbyBpdHMgZmlu
ZSB0byBqdXN0IGhhdmUgQUNUSU9OX1JFQ0lSQ1VMQVRFLg0KDQo+IFRoZSBjdXJyZW50IHZpcnRp
byBzcGVjIHN0YXRlcyAiTm90ZSB0aGF0IGF0IG1vc3Qgb25lIGFjdGlvbiBpcyBldmVyIHRha2Vu
IGZvciBhDQo+IGdpdmVuIHBhY2tldC4NClRoaXMgc3RhdGVtZW50IHdlIG5lZWQgdG8gZXh0ZW5k
IGFueXdheSBhcywNCg0KTm90ZSB0aGF0IGF0IG1vc3Qgb25lIGFjdGlvbiBpcyBldmVyeSB0YWtl
biBmb3IgYSBnaXZlbiBwYWNrZXQsIHVubGVzcyB0aGUgYWN0aW9uIGlzIFJFQ0lSQ1VMQVRFLg0K
DQpJIHRoaW5rIF9hdF9hX3RpbWUgdGhlcmUgaXMgc3RpbGwgb25lIGFjdGlvbiB0YWtlbi4NCkl0
cyBqdXN0IHRoYXQgbXVsdGlwbGUgcnVsZXMgYXJlIGFwcGxpZWQgb25lIGFmdGVyIGFub3RoZXIg
ZHVlIHRvIHRoZSBhY3Rpb24gX3JlY2lyY3VsYXRlLg0KDQo+IElmIGEgcnVsZSBpcyBhcHBsaWVk
IGFuZCBhbiBhY3Rpb24gaXMgdGFrZW4sIHRoZSBhY3Rpb24gb2Ygb3RoZXIgcnVsZXMgaXMgbm90
DQo+IHRha2VuLiINClRoaXMgc3RpbGwgaG9sZHMgdHJ1ZS4gSW4geW91ciBjYXNlIHRoZSBhY3Rp
b249cmVjaXJjdWxhdGUuDQoNCj4gVGhhbmtzLg0KPiA+DQo+ID4gPiArSW4gdGhlIGNhc2Ugb2Yg
VklSVElPX05FVF9GRl9BQ1RJT05fSVBTRUNfUkVDSVJDVUxBVEUsIHRoZSBwYWNrZXQNCj4gPiA+
ICtpcw0KPiA+ID4gYWxzbyByZWNpcmN1bGF0ZWQuDQo+ID4gPiArDQo+ID4gSSB0aGluaywgYmV0
dGVyIHRvIHNheSByZWNpcmN1bGF0ZSBvbmx5IG9uY2UgdG8gYXZvaWQgc29tZSBpbmZpbml0ZQ0K
PiA+IGxvb3AgaW4gdGhlIGRldmljZS4NCj4gPiBPdGhlcndpc2UsIG9uZSBtYXkgbWF0Y2ggb24g
YSBmaWVsZCBhbmQganVzdCByZWNpcmN1bGF0ZSBpdCB3aXRob3V0DQo+ID4gYW55IHJlYWwgb3Bl
cmF0aW9uLg0KPiA+DQo+ID4gPiArU2VlIFxyZWZ7c2VjOkRldmljZSBUeXBlcyAvIE5ldHdvcmsg
RGV2aWNlIC8gRGV2aWNlIE9wZXJhdGlvbiAvDQo+ID4gPiArRmxvdyBmaWx0ZXJ9IGZvciBkZXRh
aWxzIGFib3V0IGZsb3cgZmlsdGVyLg0KPiA+ID4gKw0KPiA+ID4gIFxwYXJhZ3JhcGh7RGV2aWNl
IGFuZCBkcml2ZXIgY2FwYWJpbGl0aWVzfSAgXGxhYmVse3BhcjpEZXZpY2UgVHlwZXMNCj4gPiA+
IC8gTmV0d29yayBEZXZpY2UgLyBEZXZpY2UgT3BlcmF0aW9uIC8gSVBzZWMgT3BlcmF0aW9uIC8g
RGV2aWNlIGFuZA0KPiA+ID4gZHJpdmVyIGNhcGFiaWxpdGllc30NCj4gPiA+DQo+ID4gPiAtLQ0K
PiA+ID4gMi4yNS4xDQoNCg==
