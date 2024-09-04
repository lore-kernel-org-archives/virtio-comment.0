Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6ED145A05
	for <virtio-comment@lists.linux.dev>; Wed,  4 Sep 2024 06:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725432417; cv=fail; b=eEWI4fpjTT1FFmgly1cx7lW9vLHzhQRnoDbMCdeCfKsPbXDtC5LlF5nINEDUrRdN1spmZXEUQFxPPxsHtlg5BMlOeay4q8stFUMUaZJWXzoGM9CzyzB1p95sg/Dczx40v8IXh3rSVfrblxKK7T/782+DslfSLx5WONmREJzZVwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725432417; c=relaxed/simple;
	bh=yT0xqHXfq1efCYD/U9cHsO/0lFrS/mE/gYXpSOrUgfE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G1NmFh5y1GQaIyV9cGUyeMJdcJQfuc+01p0+iIoeNgEskSfZ4c7DYUsu85wV/U7+D4FWDiDeyrY2braMglPQuaXZzkYfT5O/MO2aJnlRYrZ11D94koVGTBMB4wsB5JeMSu60y4yhDzKiGCsSKd9sHR5Vlpcp0u18TkbYI5OuNSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bthWmjId; arc=fail smtp.client-ip=40.107.237.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bthWmjId"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9dXs4wZj/cPTaNU57nW05Jfn8WHhDKo+FXyCGV/XJwjHS8Ff2q92PlPUdeK9flGdo0s4O3lRLZxs02KBMMumHQVX71uOiHtlYnOMvErRDWTzw2kj6Ah/0ThmE/DXGBvVm4VJOQY7zgYToD4fDyjg6e3kNLHAnySGyZ4Tkb/VlhxW41qsmC9+ZOZzpKdEcHWNwSTLdwLHSeCjJYMihn7Ip+UdQ/CNBioUJ/3K4Y1THwKQGIw3d4RHodkS96Zo4y5UvuRRm0+de18mOIm4QSxm2lA2DVFmHBONYgKEdQsnOGi8b4mIR4Yd2XHyBdjiRLI8alkLNj40bMi5ciQYr7NPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yT0xqHXfq1efCYD/U9cHsO/0lFrS/mE/gYXpSOrUgfE=;
 b=RODOyoVUOPKEttjLJQNAokTRcZcdSIgEFwo4iFm4G0mUwfU+8l9ndqKXh8dFNkViGNn9h67S0XJwSCSjfmZQaUU8SEFz4wYHYTkhlq/PCrggNWLkAkNpyIF90tDxoHOxcp84hGrrdNdmayxfphZlERfxp5v1kYaVQ9OkWXg/8pD1ea5r4Tc3peJ1fkOb5JKk95FcEFehSFyPsKpARybvh8xYuTNDaQJWyWB4ynIZMwVKCkeBx+PIyh4SwYv/JpQYbkcWaGGYhYt5Re/7c/4Z6hFvmqktw2PbL3QL79DjOQm2aAaDDE6lVdkenNVL9qUZAUwmKQsztlgSHIvMupxiwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yT0xqHXfq1efCYD/U9cHsO/0lFrS/mE/gYXpSOrUgfE=;
 b=bthWmjIdfnTg6jGLLFke1Vt+D4LztwBDA85t9w/XT4Ml5FI5U91ziKnwMQiKvshqaMheLXjhs+0tAT9pGy5Zg+YmZMEHKvBEZpTCDBM0S6UjUkvgXEOl//alF0U6VoqeghztTsovkSI/VvL/eIx+xYF1AQ2XhuBd/BWrhsvsXiuXVagNOBkjnCxBFwLgKQI2hGP093WzdMP3hnuZFBTxDucoEvZa6ePYPxhxstJGHSr0vK5gbUF27JrsjKmRk/OiRXgNyYztjifeLExIF6qlWyjsMXIqeRugmeK1lxNKKEBspoFAQaRemp6/5anzwEphlCzDMlkGsj9s4BPqwBxczw==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by LV2PR12MB5800.namprd12.prod.outlook.com (2603:10b6:408:178::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 06:46:52 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 06:46:51 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, Jason Wang <jasowang@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
CC: "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, =?utf-8?B?RXVnZW5pbyBQw6lyZXo=?=
	<eperezma@redhat.com>, David Stevens <stevensd@chromium.org>
Subject: RE: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Topic: [PATCH V7 v7] virtio: introduce SUSPEND bit in device status
Thread-Index:
 AQHa5Ab4bEzmpQ/mGUCtSlfq0w80E7IkrTCwgAASmgCAAAEvAIAABvOAgAAF6HCAA0LrAIAAAIWAgBcwMgCAAAT60IAGsmcAgAALPgCAAAWd4IAACFyAgAAAXACAARSqgIAAD3sAgAApZ4CAAAIfAIAAAfFA
Date: Wed, 4 Sep 2024 06:46:51 +0000
Message-ID:
 <IA0PR12MB8713995E39DD585341C47520DC9C2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <88a087ff-676f-4616-a573-a765ca77bef7@amd.com>
 <IA0PR12MB87133AC3C33E8D319194E361DC802@IA0PR12MB8713.namprd12.prod.outlook.com>
 <47b314dc-d8a2-489e-a84d-6670c176675c@amd.com>
 <IA0PR12MB8713EBBD32D7FF8AE8149CADDC972@IA0PR12MB8713.namprd12.prod.outlook.com>
 <928aa775-c934-4d3e-bd38-48fb6c374fc7@amd.com>
 <20240903054018-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87134BF3D3326ED35358D6A1DC932@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240903063424-mutt-send-email-mst@kernel.org>
 <20240903063625-mutt-send-email-mst@kernel.org>
 <CACGkMEtKk8Rp16sjbS1swJZ4tabVPme_b6pYggoz19m=Bd99NQ@mail.gmail.com>
 <20240903235727-mutt-send-email-mst@kernel.org>
 <CACGkMEvO=GH1ochdgJ9oT1DriDFrV+3F-TndDW1wJ39S+hPQ+Q@mail.gmail.com>
 <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
In-Reply-To: <04a787eb-c177-41e2-a05f-43375c7ab7c8@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|LV2PR12MB5800:EE_
x-ms-office365-filtering-correlation-id: 0bba228a-19b4-419e-ed0e-08dcccad5bab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RkRWQVRmTEg4cmJISmdCRUlKWDBzSjlZOXdLRm5zcXZnQmtPcFBwT0sxdUth?=
 =?utf-8?B?VVNMWFZPV2J6Nm9maGQzeUxmVlV4alVGazRkOWk5UWN4N09DeElIbjdNSUQr?=
 =?utf-8?B?UDI2UTBYZ2o1dm0xcyt1dm90QWgrR2FPTnVXTDNqc2pvWUIvOEFTdXI3cWpi?=
 =?utf-8?B?d2laQU16dngyWU1sNFpuTFUzbTE3M1hMeHZtWE5jcjFLTkQwWUNuejNGWDdj?=
 =?utf-8?B?ZVVoNUFkdWU2aktGblI4YjFlcDdId3VNWEhwb1hrUkVyWUFQRVpEb2R0UXVv?=
 =?utf-8?B?dVZmbUJHSHVMcmY1SjZNdFlWM1BOZ0YwbHJ2RnJ4RXRjTXhnTU9LQVVTTXUr?=
 =?utf-8?B?R21Ud2c3VjAyWkpUaytXM1BVRlZwbkl0Y25Da0dxQlNQcWNUbE5xQUZmOVQ1?=
 =?utf-8?B?aDVLRklzV0Y0QlEyQ0ZDbWVyeXZrSXhKT2ljcmpVSUJGcUphNnYvNkkwV0d3?=
 =?utf-8?B?VU85OG9jamJ6OG1aN2xLR1BKSW9jTC9JSGw1eFpmVG9Ub2o5Z08wZjlVdHMz?=
 =?utf-8?B?NEhMU05vSXpBRDF1Y0gwT0x6MnloUk5ISllsSDNkWjhqZWFEYXNIUy9pSlZQ?=
 =?utf-8?B?MnJtL1V1Y0l3LzI0aVhjQXRtUEtRMDZEemc2RXYrNklxcWZIM0xzWWhzdWhD?=
 =?utf-8?B?Q0w4TmFEMFRiS21Uekg5T0FDaUJUQ0c0cFVqWTJVZ0lLMFNJVk1vLzhxd1V6?=
 =?utf-8?B?MytLbDVsOEV6N0R5Zk1YdnE5TjNnZENhYzF1NWR2R29wZUs1TUFuL0h5M2Na?=
 =?utf-8?B?MElCYUwrTkVPM2s2VE1pVklmNDdjSFpBcis0L0hmNVBHVkg0VVRqLzdiaXpp?=
 =?utf-8?B?dTJCbFBrWDFobWNnYy9MdFFVNWpQNDRhTDNQVkNoNml1Y2VMTGVWR215MGFr?=
 =?utf-8?B?L0xHVjA4QUtEU2o5bi9OUkRiMDFKQzVkeXZUT2N3elhrczE4M2YwQzBmMlZJ?=
 =?utf-8?B?ajZpQmpVSGRXN2ZTTzlibkNIelhWS0VGcjJTZ2VtNHFmeW5JZ25ubzdsdXJL?=
 =?utf-8?B?Ky96TUd2WmRZNExnV01hclZXMUFZL1cvUXRoRVArYS95bHRJRDFUdlpoZzE2?=
 =?utf-8?B?dTdPMUFiTG4wMFMxbnNoQUl3V1M1Ukl2RTlpb2ZaTkR1SVd1YTN0UDRZRDVn?=
 =?utf-8?B?eEFtQ2IzcnYzR3JiekVoaDkwazJTODJkVXkvQThsSVdtY2ptdFpWUjlTTnpq?=
 =?utf-8?B?aXF3a0ExSklUWUJRT2N6RVZYK0hTdE5OVGlXRnN0NitXMTU3T1l2bDZualYw?=
 =?utf-8?B?cjljL1BEZXpMem4zT09KKzVkdUJwU0ZHMkF3dDBBWTB2NlJNeFZlVGhteEVq?=
 =?utf-8?B?ZGN2bGZuUnpPM0tJQktSRHJVR2hRRDVIYTVSWENuckpWWWNpQVdIVlNCdmxL?=
 =?utf-8?B?T3VKaHByNWQrTFFpTW1zK1FFS0tUUVFQRlBFM0RmMW5jbEZzUWt6QTNtNC9t?=
 =?utf-8?B?cTdRNVhLSGE3dTR4Y0FIaTMvZlAvZHJKNXJVVzViNnRleGlHU2Y4NExtNW96?=
 =?utf-8?B?WVZCRDRvMnBOanY4M1JlczY5bUtNYmhFVDk0clRjRkg0RDRwK3RyNE1Vbjdj?=
 =?utf-8?B?d0Vlek1tMFNpNHNmMUFiMUFNY2lOVE1PNjNEZmRTSGRva1ZWblFVYlBYNnJm?=
 =?utf-8?B?M28wcExFdkNVMlVYZnRFZWhnYzVoVmQ4bFdJMTdtdmZOSjlhOHFPSDF2eXpw?=
 =?utf-8?B?dWdHSUpCT3EzVVBWMDNlZHh5SktTdXBRYTRFRXdFTFRaODN6ZktMUEpKSHBN?=
 =?utf-8?B?SnVZMUFaZ3dtTU1haUsxc0hHRXpUejVkbDlacUxwWTEyMTRiSDEyU0c3Zy9z?=
 =?utf-8?B?eisvbHF5MnU0ZnEwZnE3Q1daSDZTb0tFK1o1N2lrTTR2aXlsTHpVenhKbGRM?=
 =?utf-8?B?bEJqNSsxVHdUdVpRQ1pNYm1hSE9abDRqSkFUVE94UHZBWEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?azVKdno5UkF2cERoWDNObWpWbVlITDc5VVpaVTVFU1UrdkRYOUZraHU2T2Vs?=
 =?utf-8?B?eC93R01oUTFMQmlaMDZ5ZCtJZ0JLdUk4Qm93dzk1c2FJUVJLSUp6bCs3cEVQ?=
 =?utf-8?B?bS9wU2poQ01Ib3NGRU9ORTdENWxnek1nUUhQeENNSWhRNUpBTmFGdnNBNVhD?=
 =?utf-8?B?MWJ6T0szY3RWRm82ZklvT2RpMEo5ZVJ0WWMzOUpKdjJ2ZlloRXNDUHFWZklG?=
 =?utf-8?B?M3ZPQlpTaWdiR2FNVTEwUkt3V1ZYYnBqbzQvWDZqdU52bDRIMWhKWEpkUWxB?=
 =?utf-8?B?akszVGdSOUdXY3ZMSGx6cVdrL2NqSEduWUtGWHRLQkdaZTV0WE84TldmOU1u?=
 =?utf-8?B?d0RHVEluRFQ0UUp2Q2RuZ3U0Uk5sS1dDNUVxWUVCTGJneHRWdmFqSmlQTXVj?=
 =?utf-8?B?NHdGSUN0NzFUOTRSeDA3YUkzQTNKY0wvWVI4c2l2RG5yY2ZML1lTQ2hMOXN6?=
 =?utf-8?B?THdDdG4wSHBYYWJLZG1ab0ZHTG10bDFLT2diSjY1T3Y3TEJjVHFLSzVvZTBZ?=
 =?utf-8?B?VVo2YlIwbVNzamYxTnVuRDY1NE95UzFYaHBGeEovREdSTFZFaEdlYittQ09v?=
 =?utf-8?B?MkdlQzJjZWR6ZXdhS1B5VnNnVVVWUnNYc1k4cXJIaDhiZUxRdmZFeDNuRXZv?=
 =?utf-8?B?QTRRME16VTNPN1RmWHIxeko2U2NzNU5TWnczUVpjQ2U1T3A0blkzSjByV3dJ?=
 =?utf-8?B?dmpmSFVkbmU4Qkh1b084ajFDbmYreHFGU0ZNbk83dG53bmR5K2p2SHI4TnlW?=
 =?utf-8?B?VE1nTFo1RjcvQ3VCYXQzVTJXYUJMckY5WDNyWjFobHdnTDJRcWhHRDljeTly?=
 =?utf-8?B?UFgwZnpEek1LOTV4ZVgxWFZFcjJKNW9YdE9lSHlQNUhiWUc5WC9YOHFoa01H?=
 =?utf-8?B?KzlseFVmUHcxcXIxeDM5aDVTYnh5Tks0SGJxb1FoZk9wekpnaU50OXpwcDlD?=
 =?utf-8?B?dWZpbkkvekNDaXVxazFwZnpDZ1J1M0sxOU03VjZCU29iUmZwaEVwSW5UZU5w?=
 =?utf-8?B?b1MyVXRaSUo1eG5tMzRNSlRjNjlkWkYrTWhDazV3NWJVOExpaGdDSlc4bWpB?=
 =?utf-8?B?Z0NTa21uaFZnVVNwOEJYYlRCKzdxZm1rOWNZSXVlK2Uwemp3TVJBeU9oVnlv?=
 =?utf-8?B?KzBmWmw0NCt2VUQwNUpITE1JaG41K0t3THg2d3VzMFBSbnA1VmlGTU5NWUFp?=
 =?utf-8?B?TlhwcVIyY2tmR3gya2ZXUk5NQkFxR2VLUWt4QVI1bmYvR3dlZWEzRTNDUjkx?=
 =?utf-8?B?aWptREs3bXlRQU1lUldmTUpTeHBiQk42VFE4alNmZzdqMi9VU1JDd3k2T0l4?=
 =?utf-8?B?VWwwUDdac2x5UkhuYThPaTNDbmNZWDhWZlRxZlRxLzlIYVQzVTBxYWFZYkRT?=
 =?utf-8?B?eWNyLytTSWFxNjBXVzlEbkd6MVU2MmhldTQ1MHB0ZW1NeVhFZU5FMlg0QVdp?=
 =?utf-8?B?STRQZ0ZCRyt4dnlNOVNBZ01mSXdCQ1RJbWFVdW5lNi85UmZTRWh3WGtSd29l?=
 =?utf-8?B?c0xPM3FGUTJLZDJWbWdDNXZqNFBuRi81ZUZrU3NCQ25ockI5am5PVXpuOFRj?=
 =?utf-8?B?YVpXWHgxdXJPenVPT2NYdHIySzJvalppQ0xoSXlGQzlRZjFUc25mRnBJUzZK?=
 =?utf-8?B?UHU4TkR6Qm92WUFnMnpnejM1M0w3TVFlaU5JZ0ZyazZDczc2eDVpWExUQUJX?=
 =?utf-8?B?Smd0b2FCb0l1cm9zZmJ4eUx6NTdoWmJGZEVodi9WSlJRczQ0YWZXc2NXSFpO?=
 =?utf-8?B?UXltb0lSSHlwVys4Qm55R3h1VEJGYjVoOXZGVWI4OERnb2ZrTk53Z0tKSGEz?=
 =?utf-8?B?bFN2QVRSY3R2bEMxc28xNFVLYzZvQmFIRHZBQjlPY21tbVRpRWNUUFJXUng2?=
 =?utf-8?B?ejVsYlJRa3kzWkJIMEdkNW5mSjduUFJlYlMvSE5yWFlVa0g4VU1GK3ZFRU5Q?=
 =?utf-8?B?ZnJldThRdlJkWktaRHdhT0JlNWIxTnZvV044eGpQcVEzcWttRE1BeW8rSEww?=
 =?utf-8?B?TTQzeDRxYmdBR2toZmpQeHlWbEdRL09ZRmFOUGdxYm9rU3c2WUswRStSTjlx?=
 =?utf-8?B?MjZ1dHI5dk5aZFlNY0psV0ZSTnYwSlBud2JJK2FJNTlYL05CdmhwcXJBZjJY?=
 =?utf-8?B?RW5UVU9mS0pPQlA2R3o1aWJyQjgrMmMyRkRLQm9jY3I0SXBZMnh4ODA3L0xG?=
 =?utf-8?Q?ecX6MUYpLmojsExPYxfb67ypy/GfOtpe9Bla2cmjzm1O?=
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
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bba228a-19b4-419e-ed0e-08dcccad5bab
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 06:46:51.8870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KvpFe1NhVobPUz4Vf+2ic7dA7E3usviYLVi31RfaAN5hOTwbgWjNOhfkHFpfXPQ3cH/LJ+PfvIYCAZmjjmnUcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5800

DQo+IEZyb206IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGFtZC5jb20+DQo+IFNlbnQ6IFdl
ZG5lc2RheSwgU2VwdGVtYmVyIDQsIDIwMjQgMTI6MDkgUE0NCj4gDQo+IE9uIDkvNC8yMDI0IDI6
MzEgUE0sIEphc29uIFdhbmcgd3JvdGU6DQo+ID4gT24gV2VkLCBTZXAgNCwgMjAyNCBhdCAxMjow
M+KAr1BNIE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+IHdyb3RlOg0KPiA+
PiBPbiBXZWQsIFNlcCAwNCwgMjAyNCBhdCAxMTowNzoyNUFNICswODAwLCBKYXNvbiBXYW5nIHdy
b3RlOg0KPiA+Pj4gT24gVHVlLCBTZXAgMywgMjAyNCBhdCA2OjM34oCvUE0gTWljaGFlbCBTLiBU
c2lya2luIDxtc3RAcmVkaGF0LmNvbT4NCj4gd3JvdGU6DQo+ID4+Pj4gT24gVHVlLCBTZXAgMDMs
IDIwMjQgYXQgMDY6MzU6NTlBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOg0KPiA+
Pj4+Pj4+IEJ1dCBJIGRvbid0IGxpa2UgaXQgdGhhdCBsb29raW5nIGF0IHRoZSByZWdpc3RlcnMs
IG9uZSBkb2VzIG5vdA0KPiA+Pj4+Pj4+IGtub3cgdGhlIGRldmljZSBzdGF0ZS4gSGlkZGVuIHN0
YXRlIGlzIGJhZCBmb3IgZGVidWdnYWJpbGl0eS4NCj4gPj4+Pj4+PiBXZSBoYXZlIDQgc3RhdGVz
Og0KPiA+Pj4+Pj4+IHN1c3BlbmRpbmctPnN1c3BlbmRlZC0+cmVzdW1pbmctPnJlc3VtZWQNCj4g
Pj4+Pj4+PiBzbyB3ZSBuZWVkIGEgcmVnaXN0ZXIgd2l0aCBhdCBsZWFzdCAyIGJpdHMuDQo+ID4+
Pj4+Pj4NCj4gPj4+Pj4+PiB3ZSBjb3VsZCBzdGVhbCAyIGJpdHMgZnJvbSBzdGF0dXMgYnV0IGl0
IHNlZW1zIGEgYml0IG11Y2guDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+IFRoaXMgaXMgd2h5IGxldHRp
bmcgdGhlIHN0YXR1cyB0ZWxsIHRoZSBzdGF0dXMgYW5kIGNvbnRyb2wgcmVnaXN0ZXIgdG8NCj4g
Y29udHJvbCB0aGluZyBpcyBlbGVnYW50Lg0KPiA+Pj4+Pg0KPiA+Pj4+PiBObyBhcmd1bWVudCBo
ZXJlLg0KPiA+Pj4+IE9yLCB0byBiZSBtb3JlIHByZWNpc2UsIG91ciBzdGF0dXMgaXMgZHJpdmVy
IHN0YXR1cy4NCj4gPj4+IEl0IGxvb2tzIGxpa2UgdGhlIGRldmljZSBhY3R1YWxseSBvdGhlcndp
c2UgdGhlcmUncyBubyBuZWVkIGZvcg0KPiA+Pj4gcmUtcmVhZCBvciBwb2xsIGZvciB0aGluZ3Mg
bGlrZSByZXNldCBhbmQgb3RoZXJzLg0KPiA+PiBUaGUgbmVlZCBpcyB0aGVyZSBmb3IgY29tcGxl
eCBkZXZpY2Ugc3RhdGUgdHJhbnNpdGlvbnMsIHdoaWNoIGNhbiBub3QNCj4gPj4gcmVhc29uYWJs
eSBibG9jayBhIHJlYWQgcmVzcG9uc2UuDQo+ID4+IEFub3RoZXIgc3RhbmRhcmQgYXBwcm9hY2gg
d2l0aCBQQ0kgaXMgdG8gc3BlY2lmeSB0aGUgdGltZSB0cmFuc2l0aW9ucw0KPiA+PiBjYW4gdGFr
ZS4gSSBjb25zaWRlciB0aGF0IGxlc3MgZWxlZ2FudCAtIGlzIHRoaXMgd2hhdCB5b3UgYXJlDQo+
ID4+IGFkdm9jYXRpbmc/IFRoZSBhZHZhbnRhZ2UgaXMgdGhhdCBkcml2ZXIgZG9lcyBub3QgbG9h
ZCB0aGUgcGNpIGJ1cw0KPiA+PiB3aXRoIGNvbnN0YW50IHJlLXBvbGxpbmcuDQo+ID4+IFRoZSBk
aXNhZHZhbnRhZ2UgaXMgdGhhdCBpdCBpcyBoYXJkIHRvIHBpY2sgYSB1bml2ZXJzYWwgbnVtYmVy
LiAgQQ0KPiA+PiBjb21iaW5hdGlvbiBvZiB0aGVzZSBhcHByb2FjaGVzIG1pZ2h0IHdvcmssIGUu
Zy4gYSByZWNvbW1lbmRlZA0KPiA+PiB0aW1lb3V0IHRoZW4gcG9sbC4NCj4gPiBXZSd2ZSBhbHJl
YWR5IGhhZCBtc2xlZXAoKSBmb3IgdnBfcmVzZXQoKSwgYW55aG93IHdlIGNhbiBpbmNyZWFzZSB0
aGUNCj4gPiBzbGVlcCB0aW1lLCBpZiBpdCBjYW4gb3ZlcmxvYWQgdGhlIHBjaToNCj4gPg0KPiA+
ICAgICAgICAgd2hpbGUgKHZwX21vZGVybl9nZXRfc3RhdHVzKG1kZXYpKQ0KPiA+ICAgICAgICAg
ICAgICAgICBtc2xlZXAoMSk7DQo+ID4NCj4gPiBXZSBjYW4gZG8gdGhlIHNhbWUgZm9yIHN1c3Bl
bmRpbmcuDQo+ID4NCj4gPiBUaGUgbWFpbiBibG9ja2VyIGZvciB0aW1lb3V0IGlzIHRoYXQgaXQg
bWF5IGJyZWFrIG1pZ3JhdGlvbiBhbmQNCj4gPiBjb21wbGljYXRlIHRoZSBoYXJkZW5pbmcuIEFu
b3RoZXIgcHJvcG9zYWwgaW4gdGhlIHBhc3QgaXMgdG8gaGF2ZSBhDQo+ID4gbm90aWZpY2F0aW9u
Lg0KPiA+DQo+ID4gQnV0IHdoYXQgSSBkb24ndCB1bmRlcnN0YW5kIGhlcmUgaXMgdGhhdCBzdXNw
ZW5kL3Jlc3VtZSBzaG91bGQgYmUNCj4gPiBsaWdodGVyIHRoYW4gcmVzZXQuIElmIHdlIGNhbiBh
ZmZvcmQgYSByZXNldCwgc28gZGlkIHRoZQ0KPiA+IHN1c3BlbmRpbmcvcmVzdW1lLiBJZiB3ZSB3
YW50IHRvIGhhdmUgc29tZXRoaW5nIG5ldywgdGhhdCdzIGZpbmUgYnV0DQo+ID4gaXQgc2hvdWxk
IGJlIG9ydGhvZ29uYWwgdG8gYSBzcGVjaWZpYyBuZXcgc3RhdHVzIGJpdD8NCj4gSSBhZ3JlZSwg
aWYgd2Ugd2FudCBuZXcgc3RhdHVzIGluZGljYXRvciwgdGhlbiB0aGUgbmV3IGluZGljYXRvciBz
aG91bGQgbm90IGJlDQo+IHNwZWNpZmljIHRvIFNVU1BFTkQuDQo+DQpTb3VuZHMgZ29vZCB0byBt
ZSBhcyBsb25nIGFzIG5ldyBmdW5jdGlvbmFsaXR5IGRvZXMgbm90IGZvcmNlIHRoZSBkZXZpY2Ug
dG8gcmVhY3QgaW4gNTBuc2VjLg0KSW4gdGhlIGN1cnJlbnQgc3RhdGUgaXQgZm9yY2VzIHRoZSBk
ZXZpY2Ugc28gcGxlYXNlIHVwZ3JhZGUgdGhlIHByb3Bvc2FsIGFzIE1pY2hhZWwgZ3VpZGVkLg0K
VGhhbmtzLg0K
