Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A367B644
	for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 04:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726029943; cv=fail; b=R8EYz66CXSZj9qXuVh1od1PaSNaH4VfRDwRh9kUSFPWqJJEYF/g3qbM1Hn1E94n+Gga4xe4AfkuYy1yzUkavHA/X4jGkezjMpuZDJQ7lBTiP5EPNIKScAB1atV4Ctz1cL0GkWhqXS2RQMD8M9mp3TKrqNoEIbPmT711nhYo0yVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726029943; c=relaxed/simple;
	bh=9OcuemeyAr/EUd0iFYUpoSsaE1V/N3q0TkR2jkjsQ3I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m2qphDb5CrpOukhRR8KvQC827+1tDjaMP2u4K1mWhkyOsR3Ucyr7x3syBtk03yjLAfyBfC/jfpCzUjWt23oQqXALDGTc63HpQxunVaoCjHDl8S0brUxynpbITRNbzVpXiyxrQTD/nJCiUhUmbZPoHsbB+slOlnsclWCxIuyaW0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rPK+X+Th; arc=fail smtp.client-ip=40.107.220.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rPK+X+Th"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcEErvk0Vk/dqxojVaYlfiqnAKYCkIwQweBvv3+KthjvlGXtv1I51qIjJmSD97p0jduFYBMX44aBHEF0Zk7WTMGc7g+GEMTYX1GAC1/IF5tT2pL67+Pg24kTvRCkz17hFBNOpTjY9x0hjNqBFrwhYhBLakKlZ7sPu+g/ZXFIIcGocy1qb1h+0D61VrYcGx6OXFNqUjlyYHOAyar6UEGWufT9lKTScPOzoxofGY2UGkkuxp90Y23RQR0G17fPpBubftFzp9yUzZ1CYrGjtz7A1QrMQJFqJ9JQTJw4khL59r1JFtSFLx/s2rhQZaNTWeLdx0vPyaNDCQ7YeDUkftiJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OcuemeyAr/EUd0iFYUpoSsaE1V/N3q0TkR2jkjsQ3I=;
 b=J0+9oKbJKE4OE+XCmz3fAqQRhzZSv+qXpnKD1mOi1tllR9p/jLeYkLLBvLdqZWFc/o5G8oJxt/vpbQac+a9gsTxFx4gRF06blybwb22jX1KJugcuHSARnr/LbRNZ+SbkBUvUcxyjnV5Qb0eJo7PqIVWy+v9/V/fOE2rIALPxj1V2A719qeXyZiGBLJgOPjN5UwIDsfsARhYeeNMzHyM/oEX8Vldg6lLAk+KOWBTFYoXjQL3vb3pFwrRbTuQAvUMrwNuyFJGGz9qhjStp24+SqTloxzgdf5X88gp/SO+wXUE1NeSASG/ASTOXH1iRKlbJ1vkb/yGFhzYZXxgwG/VCNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OcuemeyAr/EUd0iFYUpoSsaE1V/N3q0TkR2jkjsQ3I=;
 b=rPK+X+Th2zPWrsuQzl+x1Md6gOVbTpKIqRQLU9E91zr0TJZFSUeopUKMc2JuuWwKCrWSoKdRpT8O9JZMsiuejED2djPf9s3FACuKZqAACJYTWJ69WOYfnKqjVkGqdAZrDbxPFZNt6guuvmG8TksBKEQ1Hjn4FATV1KmSDO2j2+JQwxjQ606j73EBSLjBRU10c8aadGVQyCtn9g/iYTrKV7DGjNclNMesh0uwlBpvEDJHhnxSJQriuAuQgB3hyd8p2bT86MXyqHkjashyux4OihvLrxmZsT3rXJkrbovEWO4t0Zkc5pEs7VULrDR4diEMiUrf3zDgtCj4SlJcv6P1YQ==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by PH7PR12MB5902.namprd12.prod.outlook.com (2603:10b6:510:1d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Wed, 11 Sep
 2024 04:45:36 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 04:45:36 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] admin: Enable driver to send admin commands before
 DRIVER_OK
Thread-Topic: [PATCH] admin: Enable driver to send admin commands before
 DRIVER_OK
Thread-Index:
 AQHbA6QB1dLNvHRBLkyvjpsHR6lgt7JRWCUAgAAGYtCAABwqgIAAcPQQgAALNQCAAABssIAAClYAgAABBACAAAB/0A==
Date: Wed, 11 Sep 2024 04:45:36 +0000
Message-ID:
 <IA0PR12MB871329260A003AF902C78956DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240910170723.44537-1-parav@nvidia.com>
 <20240910142850-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87136FC9671ABFF7123A82CADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910162247-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713AC1D273671DF459FA254DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <8a42e214-59b1-4085-aec0-0f31be885525@amd.com>
 <IA0PR12MB871350EE73BFB2B8B60B7E97DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <CACGkMEtUvJhAq9Y-hZ8NroupJgarYhB8qz-cLXNQYrvnoGKgbQ@mail.gmail.com>
 <5d0cf855-ead0-46a4-8221-d41c0a3be15f@amd.com>
In-Reply-To: <5d0cf855-ead0-46a4-8221-d41c0a3be15f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|PH7PR12MB5902:EE_
x-ms-office365-filtering-correlation-id: 30e81ff8-4a7b-49e1-a114-08dcd21c9438
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Zmh4eEdWSXRDY21LSFgxVXlzL2l5QXpqMjRsa2FTSkxneDBlM1hReE1kRDda?=
 =?utf-8?B?dE9NY3Q2QU9aWDJyeHJCbHZYSTI2cHdPQkxGb1pZQlNaeDduVEZFVUpqU2xQ?=
 =?utf-8?B?VDRLaERhSW52Szk1dzhnbCtZY2o0aXJ3a25qQkRqTWZoaFV5RmdHcWtVeEZ1?=
 =?utf-8?B?Y0pES2JhaU4yVU9pai9SUG5DM29Lb3RnZExibUhuUFdPMGRvbDI2bjZLelgr?=
 =?utf-8?B?Yzc5NzFMZXNSVVh2WXNPdFM0STVDQmRESDk5Ynh3UjN5LzFsc2NXUDZzTWs1?=
 =?utf-8?B?WFpYT1lNUExMOUxQU0l1MjNXM1UwOThkbThHc1VrcXpPbDFHbmFrRSs2Y09Y?=
 =?utf-8?B?MzJUMk03cTFrb0o5T2gwU3l1R1pNWS8yS1MranRBTWRDZE8zNkgyOHVKYVJL?=
 =?utf-8?B?cGxKUk1xMjhxdkRsaTZBNmJHT1NZZkFCM1B2Z3lscTlNWWdsNnRIVGRYUUVx?=
 =?utf-8?B?dmdrSDBSU09ldWtiMGFHMnVLTEZlQjQxMk5BYkk0UmxzTmZPUTBmWE9SQWpH?=
 =?utf-8?B?WGI3WnhvWG1VZlhqcXE4TXowdnl6bHF3MW93dDYwK2pmMm9lOFBWeXR5RGV2?=
 =?utf-8?B?QUhNRjI4NTAvZWpEaDRraENtNlJ6UVoxSkswRUVVQ1FyeUtHUjJBZHFvLytI?=
 =?utf-8?B?MDBZR2hSWW1mUk5IMDl5NDZHa1VuWGJPT0JZV0VmdHlUaUErM1lrUXpwNU40?=
 =?utf-8?B?bDBrMkVuTHg5a3hTOXlHbDJYZWhyWHRqL0VyVVh2cU5WQXY0SG9NL0s2dEx0?=
 =?utf-8?B?bHJKL3d1ZDZrRXB4OUNTOVVNcFlPQ2llVmc0cUI0VXZzdmNCY0JZKzBoK1lM?=
 =?utf-8?B?MU5nM05FMUZCVlVTOUs1VDFzUXRuM1NpQ08zeU5mU3Y5dGNpdnpXTWtLcDh4?=
 =?utf-8?B?SCttWlVPMDBYTzl3Q053UTl5K0p3a0tPYUZyaWtlbXFkQWVjMlJVMFdhYlFi?=
 =?utf-8?B?c2o3Rmx5Z1h3ZUw3OFIraCtISXhRTGF4VUFyMWtOaTVnUVNERXBmNk0vSkRp?=
 =?utf-8?B?cGJpVlpPa01jSytXcDdHUmJCMG5WMlI1LzR6RkppOCs3Z0VoNXpLb2Z5UUsr?=
 =?utf-8?B?c0dWeExQL2QwZjRxNkk0RFBESWNHbmd0RXFQL2FBdGYya2FUclFoV0xnbGVR?=
 =?utf-8?B?blgrLzhJekV0M2w2OWFCT0JSdG5BMHpIcDJOM3F6ZW50QndSSWg3OVF2Z0x5?=
 =?utf-8?B?WmlLdmpUOFh4MEV1MU5QclM4blNEZzg2R3JFRlFoK0g2RnBybE5DVXAxK3RV?=
 =?utf-8?B?aTBFc1o4Tm1HTWFqOUtxQ05KdnlWNjVWZnJOcWpyOHRQZVVaL043S3dCV3R5?=
 =?utf-8?B?VXRtYnFQS3JkZ2RjTmlEbUppbGZmRDVnZFVmQ2h1NXlpVkJTZEFSNGpudGtk?=
 =?utf-8?B?N3N5bzhGR2FyZUZNZHBEYUdSWjQzcEx4blFUR2JOZUw5UTVqeldzSC92Zlps?=
 =?utf-8?B?aE9yWXB5cXBkRE5NQVBwREF0cmpGSGJVdGJqYnFNR1kxS3FWZDg2bGJMN0Yz?=
 =?utf-8?B?QnAwaDVYeU5lTWlsMUZNd0dnSGRrcklzSWxsbXhvWDFJRC9aUXN1ckszdGY1?=
 =?utf-8?B?dVVmTktxOTZLdlJ5TFQ0V3hHZFBNRWlEVGFpRTdkUW5YdFlsVFRqZ1YrbDcv?=
 =?utf-8?B?QVZhVUFudkVudDlpK1BrUGVFUVh4cGpOT0FRRnFOZGtHSGpsQm1LSGowZGxN?=
 =?utf-8?B?YUtQWXhNWWk1NmhnSzY3TEJGTkhyNUhlZkhVUEF6bmNIVGg3TWZLeEUyd0Fo?=
 =?utf-8?B?a1ZrWTJvOW85cy90aHA4WWlSd0tNejF1T1RqcnlFTEtHR0dNSUJsb21ZT0ZC?=
 =?utf-8?B?cysyVllWbVVtT2dzNzIyclNXMU1acVpiUCtYOGJEVU0xTmpCUk1hZHJSaFox?=
 =?utf-8?B?cHF1KzhvWHY3WjBpWlN6eVMyWXd5Uk1vakdnTTk4elcrdmc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?czFzWTkyUCtNNU9uNzNMK0N0NyswTnpoMnhkd3dicy9jTEpQbDl4QmJjV1o1?=
 =?utf-8?B?c3BKaHBjTzJleGtReTNEbkNPZFVxRDl4UFBENUZiNklFUzJPQ0RlQmlSMUVQ?=
 =?utf-8?B?YTlHSk9EMUFNOEQyNitPY1pCc2oySUk5KzZxSnhjcHQ0cjNOcWtNQ3FiNjBH?=
 =?utf-8?B?UGlLb2dnckhkVmVCZVdoRkFqcTZjcElodVlZNlo1YjVZbjRyVEltVHpSNTZX?=
 =?utf-8?B?WFhsdzNQZ014UHB5RjZyK3lHK2JBMklKV3hNUy9iYVkxMkhlR3VzNGRDWlND?=
 =?utf-8?B?QlJlem1Mdk93SUlKM1JtaUJBRWwzelFlRDljTCtTYlFnbXR6dmpudFF4MjRa?=
 =?utf-8?B?UDM2a1FQc2VITWh4NlBJbGdZczB4Y3R4d0hNSnNJWlNHT04vRGlFWHg3UlZZ?=
 =?utf-8?B?djFUVHhSZFl4bllOTG9ndmdyMXZoVkNVZGxkQ2NRcFF1VlljWTllZE5tbmZL?=
 =?utf-8?B?MGpQSCt0M3JzSGVzS2gwYzFzeWU4STZ3eWxTSitSMFRnTEVFajc4Q1ErOTdy?=
 =?utf-8?B?d1lVTjRJcElKdkZ2d2RXb1VmbS9mQjV1blBXeWh2amlBQWdvdkZwUDM4aXpw?=
 =?utf-8?B?bzdnengycS9GQmFDazQ5RzVZUTczbk1SWGpHTHBsbThZVWp4TUdWZlJYeGFV?=
 =?utf-8?B?Z0xGVjM4UjkzdDJNR3RNWnljRVVsUkhHV0g2azBRMzlOeWZ1ZmtFYnlKbmZ0?=
 =?utf-8?B?T3V5ZFd3NlhJMU00N2E0dVNVektHaEMxRks4NEZmOUpwM2J3dmREdXpvT1B4?=
 =?utf-8?B?QjI5VG9hYVVpcHNGRlk3SXNZZHBFSHI0NUJDNWlVdWtIVjBVUUwyUFBvSWJq?=
 =?utf-8?B?QyszZ0pFbHpjbVpSOStldDg3Z0ZuekpocEphSDRsWmVEbVFJOTlnNFUrcXBC?=
 =?utf-8?B?cUJqMzdDNjZWbW1FY2RwN2s0dTBwYmJZSlhGdlFob0FvY1NPck1hekVOS29T?=
 =?utf-8?B?cjNBZ2JxWUlxN3Z4aUZrNzhMR1lCYTl6U09tcG9ZbkR6MnFjSjFxZWtYMjVo?=
 =?utf-8?B?Qk5sUXNESEE3RzlxN2I3WnZwT0JmTm1jLzd1dkxGRmh5Ym8rcFNsQ1c2ZnBH?=
 =?utf-8?B?eUJaRnVUbTFVaUd5cGxjNEtxaisrQ3hhajdmWjVLZzZBTXdCS0t5OWJ6TU81?=
 =?utf-8?B?K1hGZUI0VVdrenE5SXduSWwya2k1UXpKdnNuUG5QQmhGZjFLSFRDeFkrQXl2?=
 =?utf-8?B?NmNpUTZKMDdwc0xVSXFNUG9pNkxRRTdsY2FhS0ZtWDRUYzBFR0oxakFTZmtm?=
 =?utf-8?B?TWIwNHJkSXdmMWFKenZUVzhWR1Y1RGswdjRzNkVnS2hlUGFsL20wWFVscGJy?=
 =?utf-8?B?dW5WamlLeC9JTkJzRGwwTDJTL0l2ZmZSZ011cDNyUktKa0xzUnB0TzAzSmdG?=
 =?utf-8?B?VUpSK3I2WTNxT1ZIa0poaXJ5R1kzR24wN0J3N3Rtc1FvU1liaGtyQUZIcFhq?=
 =?utf-8?B?NjlTNHdoZFhsRkgxT1kyVmc3cmJpMjlTajVNRWtZZm5PcDR5dnlBZEhia0c2?=
 =?utf-8?B?aEFoMmFFTU93akovV0syb2wySkNnbXJTaEVvRzRyOHRXQ2t1WVJIdEdVWlJk?=
 =?utf-8?B?ZVg1LzJwc01aM1lIZ1Iydm9Ncm1BeCtmSXZKS2RmREMyMjBlMm01L3JQcTVM?=
 =?utf-8?B?cjhXUWVSZ1N4MEs1TFNDRFI5QW9mLzNxT0grVFhqYklCSk9GVCttRlZQRmJI?=
 =?utf-8?B?Q1I2bGVPR3pHTWhYQ3FRSVFRQnJ4OEpheGtzMjBBakdLd3Q4ZWNETlRvZ2V0?=
 =?utf-8?B?MUROZENCWEs1YjhtY3VhK2ZZNjBWWlNPdW1UVllic3JMK1ZpMGpHYlozbS9n?=
 =?utf-8?B?ckhBQW1MT0JqaVBXaTg3WXZ3RmJ1a0k2Um5NMXFnTXdKUUlCNDFsSU8xUEc2?=
 =?utf-8?B?SkwxbHFyaGI5Vyt1Q3hFT1dmL2cxeno3T05wcEY0cnA3WStlMDRyNU5JR0Rh?=
 =?utf-8?B?aFVBYVVTOE5qV2R2OEQ3ZldFWkVrWUlBeVVCSVBhOHJ5V1BCZ3hUMi93WEk1?=
 =?utf-8?B?MWVybHBoWmxSTCtvYVczQ2RyMjZQdFl4N1o2dlZKUFlqelk5MVpNeXoreW5l?=
 =?utf-8?B?MWlwamw5QkFXd21YNGtpZ1RIUVdQdXdhMElZWkhqT2p2cjdhNjd6V0FpLzlI?=
 =?utf-8?B?aWRMZVliWFlQSGpnR0VWd2hDdVdqSUdZTm9iRkhkeFFJL2lqd2ZRNlNZdm5l?=
 =?utf-8?Q?h8vYMPpwhnot28UvXCiXU+IbFNRletE7bVv6p9haNS2L?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e81ff8-4a7b-49e1-a114-08dcd21c9438
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 04:45:36.7322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2lE7I/6XfWpusV5Je0FgP2lTMyM5Hch6Lm0SlWK8/0IKnpsGMJWFQgCzGiUkvNhViOC+fGhCDz37kDudrzwCSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5902

DQo+IEZyb206IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGFtZC5jb20+DQo+IFNlbnQ6IFdl
ZG5lc2RheSwgU2VwdGVtYmVyIDExLCAyMDI0IDEwOjEyIEFNDQo+IA0KPiBPbiA5LzExLzIwMjQg
MTI6MzggUE0sIEphc29uIFdhbmcgd3JvdGU6DQo+ID4gT24gV2VkLCBTZXAgMTEsIDIwMjQgYXQg
MTI6MTLigK9QTSBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQo+IHdyb3RlOg0KPiA+
Pg0KPiA+Pj4gRnJvbTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAYW1kLmNvbT4NCj4gPj4+
IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDExLCAyMDI0IDk6MzAgQU0NCj4gPj4+IFRvOiBQ
YXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+OyBNaWNoYWVsIFMuIFRzaXJraW4NCj4gPj4+
IDxtc3RAcmVkaGF0LmNvbT4NCj4gPj4+IENjOiB2aXJ0aW8tY29tbWVudEBsaXN0cy5saW51eC5k
ZXY7IGNvaHVja0ByZWRoYXQuY29tOyBTaGFoYWYgU2h1bGVyDQo+ID4+PiA8c2hhaGFmc0Budmlk
aWEuY29tPg0KPiA+Pj4gU3ViamVjdDogUmU6IFtQQVRDSF0gYWRtaW46IEVuYWJsZSBkcml2ZXIg
dG8gc2VuZCBhZG1pbiBjb21tYW5kcw0KPiA+Pj4gYmVmb3JlIERSSVZFUl9PSw0KPiA+Pj4NCj4g
Pj4+DQo+ID4+Pg0KPiA+Pj4gT24gOS8xMS8yMDI0IDExOjM3IEFNLCBQYXJhdiBQYW5kaXQgd3Jv
dGU6DQo+ID4+Pj4+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+DQo+
ID4+Pj4+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDExLCAyMDI0IDI6MDYgQU0NCj4gPj4+
Pj4NCj4gPj4+Pj4gT24gVHVlLCBTZXAgMTAsIDIwMjQgYXQgMDc6MDE6MDhQTSArMDAwMCwgUGFy
YXYgUGFuZGl0IHdyb3RlOg0KPiA+Pj4+Pj4+IEZyb206IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0
QHJlZGhhdC5jb20+DQo+ID4+Pj4+Pj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTEsIDIw
MjQgMTI6MDIgQU0NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IE9uIFR1ZSwgU2VwIDEwLCAyMDI0IGF0
IDA4OjA3OjIzUE0gKzAzMDAsIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPj4+Pj4+Pj4gQ3VycmVu
dGx5IHRoZSBkcml2ZXIgY2FuIG9wZXJhdGUgYWRtaW5pc3RyYXRpb24gY29tbWFuZHMgdXNpbmcN
Cj4gPj4+Pj4+Pj4gYWRtaW5pc3RyYXRpb24gdmlydHF1ZXVlcy4gQWRtaW5pc3RyYXRpb24gdmly
dHF1ZXVlcyBtdXN0IGJlDQo+ID4+Pj4+Pj4+IGVuYWJsZWQgYmVmb3JlIGl0IHJlYWNoZWQgRFJJ
VkVSX09LIHN0YWdlIHNpbWlsYXIgdG8gYWxsIG90aGVyDQo+ID4+Pj4+Pj4+IHF1ZXVlcy4gVGhp
cyBpcyBhIGxpbWl0aW5nIGZhY3Rvci4NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gTWFueSBvZiB0
aGUgZGV2aWNlIGZ1bmN0aW9uYWx0aWVzIG5lZWRzIHRvIGJlIGRpc2NvdmVyZWQgYW5kDQo+ID4+
Pj4+Pj4+IGNvbmZpZ3VyZWQgZWFybHkgZW5vdWdoIGJlZm9yZSB0aGUgZHJpdmVyIHJlYWNoZXMg
dGhlIERSSVZFUl9PSw0KPiA+Pj4+PiBzdGFnZS4NCj4gPj4+Pj4+Pj4gU29tZSBleGFtcGxlcyBh
cmU6DQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IGEuIGRyaXZlciB3YW50cyB0byBkeW5hbWljYWxs
eSBjcmVhdGUgdGhlIHZpcnRxdWV1ZXMgb2YgdmlydGlvLW5ldA0KPiA+Pj4+Pj4+PiAgICBkZXZp
Y2Ugd2l0aCBtb3JlIHBhcmFtZXRlcnMsIGZvciBleGFtcGxlIGhlYWRlciBkYXRhIHNwbGl0LA0K
PiA+Pj4+Pj4+PiAgICBtdWx0aXBsZSBwaHlzaWNhbCBhZGRyZXNzZXMuDQo+ID4+Pj4+Pj4+ICAg
IEhlcmUsIHRoZSBkcml2ZXIgbmVlZHMgdG8gdGVsbCBQQ0kgZGV2aWNlIGVhcmx5IGVub3VnaCB0
aGF0IGl0IG5vDQo+ID4+Pj4+Pj4+ICAgIGxvbmdlciB1c2VzIHF1ZXVlXyogcmVnaXN0ZXJzIGZv
ciBub24gYWRtaW4gcXVldWVzLg0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+PiBiLiBkcml2ZXIgd2Fu
dHMgdG8gZGlzY292ZXIgdGhlc2UgZmVhdHVyZXMgYW5kIHJlbGF0ZWQgYXR0cmlidXRlcw0KPiA+
Pj4+Pj4+PiAgICBlYXJseSBlbm91Z2ggc28gaXQgaGFzIGNoYW5jZSB0byBkZWNpZGUgdG8gcHJv
Y2VlZCB2aWEgYWRtaW4NCj4gPj4+Pj4+Pj4gICAgY21kIGludGVyZmFjZSBvciBwcm9jZWVkIHRv
IERSSVZFUl9PSyBhbmQgZm9sbG93IHRoZSBjdXJyZW50DQo+IGZsb3cuDQo+ID4+Pj4+Pj4+DQo+
ID4+Pj4+Pj4+IFRvIG92ZXJjb21lIHRoZXNlIGxpbWl0YXRpb25zLCBpbnRyb2R1Y2UgYSBmZWF0
dXJlIGJpdCB0aGF0DQo+ID4+Pj4+Pj4+IGVuYWJsZXMgdGhlIGRyaXZlciB0byBzZW5kIGNhcGFi
aWxpdGllcyByZWxhdGVkIGFkbWluIGNvbW1hbmRzDQo+ID4+Pj4+Pj4+IGJlZm9yZSBEUklWRVJf
T0sgdmlhIHRoZSBhdmFpbGFibGUgaW50ZXJmYWNlIHN1Y2ggYXMNCj4gPj4+Pj4+Pj4gYWRtaW5p
c3RyYXRpb24NCj4gPj4+Pj4gdmlydHF1ZXVlLg0KPiA+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQ
YXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5jb20+DQo+ID4+Pj4+Pj4gV2Ugd2VyZSB0aGVyZSBp
biAxLjAgYW5kIGl0J3MgbWVzc3kuIEFuZCBuZXh0IHRoaW5nIHlvdSBkbywgeW91DQo+ID4+Pj4+
Pj4gd2lsbA0KPiA+Pj4+IEFsc28gaWYgeW91IGNhbiBleHBsYWluIHdoYXQgZXhhY3RseSBpcyB0
aGUgbWVzcywgaWYgdGhlcmUgaXMgb25lPw0KPiA+Pj4gQXMgZmFyIGFzIEkgY2FuIHNlZSwgdGhl
IHNwZWMgc2F5czoNCj4gPj4+IFNldCB0aGUgRFJJVkVSX09LIHN0YXR1cyBiaXQuIEF0IHRoaXMg
cG9pbnQgdGhlIGRldmljZSBpcyDigJxsaXZl4oCdLg0KPiA+Pj4NCj4gPj4gVGhpcyBwYXRjaCB1
cGdyYWRlcyB0aGlzIGRldGFpbC4gUGxlYXNlIHJlYWQgdGhyb3VnaC4NCj4gPj4NCj4gPj4+IEFu
ZCBubyB2cXMgYXJlIGFjdGl2ZSBiZWZvcmUgRFJJVkVSX09LLiBIb3cgY2FuIHRoZSBkZXZpY2Ug
YXNzdW1lDQo+ID4+PiB0aGF0IHRoZSBkcml2ZXIgaXMgcmVhZHkgYmVmb3JlIERSSVZFUl9PSz8N
Cj4gPj4gRGV2aWNlIGRvZXMgbm90IGFzc3VtZS4NCj4gPj4gV2hlbiB0aGUgZmVhdHVyZSBkZXNj
cmliZWQgaW4gdGhpcyBwYXRjaCBpcyBuZWdvdGlhdGVkLCBkZXZpY2Uga25vd3MgdGhhdA0KPiBB
USB3aWxsIGJlIGxpdmUgYmVmb3JlIERSSVZFUl9PSy4NCj4gPj4NCj4gPj4+IFdoeSBhZG1pbiB2
cSBpcyBzcGVjaWFsPw0KPiA+PiBCZWNhdXNlIGl0IGlzIHVzZWQgdG8gZG8gZnVuZGFtZW50YWwg
ZGV2aWNlIGFuZCBkcml2ZXIgY2FwYWJpbGl0aWVzDQo+IGRpc2NvdmVyeS4NCj4gPiBUaGVuIHlv
dSBuZWVkIGFub3RoZXIgdHJhbnNwb3J0IG9yIGEgY29udHJvbCBkZXZpY2UuDQo+IFNvIE1heWJl
IGl0IGlzIGEgZ29vZCBjaGFuY2UgZm9yIG1lIHRvIGNvbnRpbnVlIHRoZSAidHJhbnNwb3J0IHZx
IiB3b3JrPw0KTm9wLiANCkFRIGhhcyBkZWxpdmVyZWQgd2hhdCBhbGwgd2FzIHJlcXVpcmVkIHVu
aWZvcm1seSBmb3Igc3cgYmFzZWQgZGV2aWNlLCBQQ0kgUEYsIFBDSSBWRnMuDQpMZXRzIGZpcnN0
IHVuZGVyc3RhbmQgdGhlIG1vdGl2YXRpb24gb2YgdGhlIGNvbXBsaWNhdGlvbiBmcm9tIEphc29u
Lg0K
