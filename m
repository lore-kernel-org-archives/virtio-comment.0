Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B806935893
	for <virtio-comment@lists.linux.dev>; Tue, 22 Apr 2025 06:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745304931; cv=fail; b=qyQIrSYUG4VKqw4NhHi9yoqNFkIFv3RCdJ9HIxGif9S4/jUkIZfK4t6i0zpr1/92/IBw0qyRF3R4fJ/9F+uoYSdFAxc5ulcjUCdDrnVkfkTNqwZ77Mvr6PABUYgLXUJMsH0fkNs8pt0LmknrnJwlEYnZUE47BFRK5g+p1wtCEIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745304931; c=relaxed/simple;
	bh=UQNCc4kclk9+jFZcigY0verDdiY14jhgpd47xuYcsbU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uwb1hCuJ+KZAWZIDQrX+LgkCrkAT4BYN6kihQSvj66uFwktXWikxGCUmQSb7bcDujCvsD/FokVvF/tUQyQ3jVR9EbjYLitKaKFbDZVyjs3kSNBAqMtV53IoV+fld05fvs4HhpHMtxOAIy3Uk/gvgl75mLrBAwWpk/qhWEtXoFT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=FMm0gcR3; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="FMm0gcR3"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M5WVBO005416;
	Mon, 21 Apr 2025 23:55:23 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 466521043g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 23:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bu3kQlhljvASGFZXwZHMJQV8iOSifCfSlv+UmJOWSZEW4kpxOGN4F9TcvILbyj0w60x/Rx5HzH6rt59/rOhmEw9dqCt3wilgtS5XBSlhfArxomDg5vN9qU5ANWCFMXqgCCC/sGyBGEe26MsKbczaB/PK6spu1grrvrzrQh2ypVkRWoSG7OFxgkJ8tm4wwF/BuXnw3jg34Jw5zilpTUYHsAC+5ymI1FphhuZWL8QcW4pV/9j7NEDklNPniTsjmAExz942CZrf080ZpqgRZlEIUSZWuicwH/zEpJoSApmQUN5Lle1wMLt8MSyOe3wtVEe0usruHgX7X5vZRfXLMz+Zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQNCc4kclk9+jFZcigY0verDdiY14jhgpd47xuYcsbU=;
 b=LFEvl9oIbCs5oZ8017L+8t5UENtKQmiW9PcRPNqTM2Ztl1oXN6R1qBbtdkMa8ixuUd2OObODWD7zIIKaJTRF/nrlrGbDJZA+v5ypv4QuZRkpYUVCilFN2FeqyqNfNHEzdr7EScNS42yxBCh7Rcx2jbgaeCBbq4WPCnSj38K2T4cIftoNwA6TCfaWMYAFiWpXAYC9Pc+lqrTscE8dv+pY60fkXcLk5j8fD5jG8Nv1a+cZ4V+xQZWVLSz1D9lfMBfxsnj7fLESTwOT32F9qkf1HK0mQh5YY7yiS9nd6GCT2cPa11XmJ7sLvn99fSmo+tlavR5iOUDBqdg28bnorDlEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQNCc4kclk9+jFZcigY0verDdiY14jhgpd47xuYcsbU=;
 b=FMm0gcR30fO2ocjEfNABtdr30FXPbeHJr5h/Mo8OLgGnaL1nzVUhHemoW3rxSShNPtEgnYLlQ4+1WkOmf3QyjiIwmlSMFxeL3aw2CnvLobwPeIYskr6HEwHKyHfHNTJIH4nNOLuT00mNa8zyZwtOuoTfMMpGEnhw5bplWuy4lX4=
Received: from DS0PR18MB5368.namprd18.prod.outlook.com (2603:10b6:8:12f::17)
 by PH3PPF8F489144C.namprd18.prod.outlook.com (2603:10b6:518:1::cb2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Tue, 22 Apr
 2025 06:55:18 +0000
Received: from DS0PR18MB5368.namprd18.prod.outlook.com
 ([fe80::ad53:bef2:cc17:13ac]) by DS0PR18MB5368.namprd18.prod.outlook.com
 ([fe80::ad53:bef2:cc17:13ac%5]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 06:55:17 +0000
From: Srujana Challa <schalla@marvell.com>
To: Sebastian Mauritsson <sma@napatech.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>,
        "pabeni@redhat.com"
	<pabeni@redhat.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        "parav@nvidia.com" <parav@nvidia.com>,
        Satananda Burla <sburla@marvell.com>,
        Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>,
        Jerin Jacob
	<jerinj@marvell.com>,
        Shiva Shankar Kommula <kshankar@marvell.com>
Subject: RE: [PATCH RFC v4 0/4] introduce IPsec Operation in virtio-net
Thread-Topic: [PATCH RFC v4 0/4] introduce IPsec Operation in virtio-net
Thread-Index: AQHbqFlRwNYemSW4v02rNfOQFMz0EbOkw2mAgAFVS7CAADEdAIAJBVRw
Date: Tue, 22 Apr 2025 06:55:17 +0000
Message-ID:
 <DS0PR18MB5368A12195BBB0B27AB86E1DA0BB2@DS0PR18MB5368.namprd18.prod.outlook.com>
References: <20250408073857.1783779-1-schalla@marvell.com>
 <HE1P190MB0265957E736DFC9597429820CEB22@HE1P190MB0265.EURP190.PROD.OUTLOOK.COM>
 <DS0PR18MB53686E9A5732AA2AAC0656FBA0BD2@DS0PR18MB5368.namprd18.prod.outlook.com>
 <HE1P190MB026554E9C3AD9DFC3A0DD1DBCEBD2@HE1P190MB0265.EURP190.PROD.OUTLOOK.COM>
In-Reply-To:
 <HE1P190MB026554E9C3AD9DFC3A0DD1DBCEBD2@HE1P190MB0265.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR18MB5368:EE_|PH3PPF8F489144C:EE_
x-ms-office365-filtering-correlation-id: 6e5f12a8-60b5-4b2a-48dc-08dd816aa41a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?utf-8?B?Zy9yRlRDYVRIWlRobEo5SVMrQ0JCZ3FsNnVqNkVaUko5NFlaWXlXNkhGUVJO?=
 =?utf-8?B?S1VzSlpKYjV0QUxOUnRVUmd0U2tLK241UWtwbHRVOHJSSUJhbUsxTjNPWDNq?=
 =?utf-8?B?aG9uQW5PbDBCOFZDbWFLc0ZlYnBwb2FBOW1yVzhJOHVpM1lMeWFiT3FZQ0JZ?=
 =?utf-8?B?SDNDejFwUEZMb0xrbzBqZXVDUVY3RWFFY0pJZ0oxdG82a0c0ZTg1RmdMZVY2?=
 =?utf-8?B?NWk1ZEE5dVBtVjcrME9ic1l4UG1zTkF6K1JlU1FKVVpiOHcvQVNuMGVaZnRp?=
 =?utf-8?B?QjlXTlljSjc3RE5pVEQyWGRlMXA1d3ZETWNpN3lOQWxjM2FpTGZSSG02a3Za?=
 =?utf-8?B?SlNEbmEzVWx6ODdwMDYyd2xJQWxhMUdwell1Z29BalRoeHNMa1hXaDgwY3lF?=
 =?utf-8?B?dzBOeG1Fb0pveFdlNFFwQXlTdDJaWTgyNmRJVmVHWHREaldQamhIVGpXVHZ1?=
 =?utf-8?B?blpQN09ianY2OStKc3YxY0pESVJORkl0clRBU3NkZjZkNU00WXg3N2RlVjlz?=
 =?utf-8?B?RG1rdzdNTFRNMHNjQ3AwRHRlSmlENGd6eW9HUDZBWGJZZDBtT1I4ekdPV0p3?=
 =?utf-8?B?T1JVMUgySkVRVUpTZGd4YmtGZ1RhTEw1MC9BdGpNTVJIeGZPcVFiSzdGUkdI?=
 =?utf-8?B?TXowRzRmS1k0UG1BUmY5ZHc0cTRUL3JGd1orSWFkVExlMHF3N2ZjbXE4dFNF?=
 =?utf-8?B?Y3dDRFc3NEtBOUJVamltcUhHYXViK3NEYnU1d1NMajZySHR6WkNmMUUvakRv?=
 =?utf-8?B?WnhXZVI2Q0tvaGJscXVIM05uRVFSQzdaQzVnK2twL1l5bDZycndVcFhLcngv?=
 =?utf-8?B?dFJTeGFvaitYZFR6SnBZU1FDdnNMWE5jemVpb1IvUzZiekIvNDJaNk5yTEsy?=
 =?utf-8?B?Vk9Td3NXSXZCTUJCbjA5cjJMVm1LWnBObHg4eXh3RFlIN1RRY05vd3c5dWV4?=
 =?utf-8?B?cGlaTFloN1RQL1EzTDJITEcwYldncy9FMWdyMkdaSDFob1E3bVlxbERiZURr?=
 =?utf-8?B?NUdnQzFUQVJpL3dDQWtJMGtGVW5NOWw0dDNnRkRaQjVOWlVHRDVPYXU2eVZt?=
 =?utf-8?B?ZU0vaXFCeVYxN3ozK2c1QitJa3dRVlFFVS9pWFFQRURRZFFGYjlyd3RmaVFm?=
 =?utf-8?B?TG14TlVyNE9yTm5WeFJHN01ka0t4M0RmUmU2MHc4OUdjUmgyUHZrSStnK3hj?=
 =?utf-8?B?UGgwN09OclI0WDc1Mmd0QThBTm50MHdPMlAvVUNsZlQrUnhHR252cVVteStx?=
 =?utf-8?B?ZjBKK09oc3NvaEd3K1FTUzRpR2hrNDRXakFIKzBLZUlyU0pXb2s4bE1pQUdw?=
 =?utf-8?B?dWppbkFJaDkwZTQybldaaTJ1Q21jaHh2ME9iL1g5ZFZyN3BFMG8vWFl6dmlD?=
 =?utf-8?B?V2Z4c3NIL1Y2YXJLTGxzTVN6dEp3U3l1a3hHdmppRlpNOG9PUmxvU0RXSGlm?=
 =?utf-8?B?T2wyWGNHK3hZZmZHM1prNDBYMzVZb3BBRzBUYnMwcEduQVRqWDA5Zng3UHBy?=
 =?utf-8?B?bStTM0xNa01rODg0L1RrNXlMNUFjalhwWHBhV25qUTJwaDY4SDNxRWdlM0Nn?=
 =?utf-8?B?UVVlWHQ2c2xqUWlRSDFJVUtFanZzNlBiUlI4R1dIZmFTQ3BrQUllN1dScThs?=
 =?utf-8?B?SW5mMjg1bC9aOHJkMDhhT2lSMDhjSTBBRlRxUjBDTGRvWFBQelcyVFdqdzFN?=
 =?utf-8?B?SFcrRnFhK1d6cU5LWGJZbXNBdEJpdm4rRkhsK1NWeW9tS3hGckFUOWRIc3pD?=
 =?utf-8?B?KzJNMUFsM3pVUUR4bGN3MXU0a3c5MDNGSnkwZFlYUmlEV1ZvMTd1TUJKeUZY?=
 =?utf-8?B?WHVJR09FbFF2aHBnWGtLT0p4Qjl6SHd3SW8rMkNneXRycnQ2eG1TZHkvUWpV?=
 =?utf-8?B?OWRtK0x3dWlJTnMrdnoySVNqT1RicTNkRXBDczhXUU02WmZ2T0txaXJmNlVJ?=
 =?utf-8?Q?rJ8fuCHKTCE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR18MB5368.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700018)(13003099007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RC94eEtqNzVQMkN5TjBLcmtmUnBDKzhqTm1la3l2MjdHQlBZWjRNQ2JoTE9o?=
 =?utf-8?B?U2llYzVabWxwanFXU1Vkai9JM1RvT3NzSE5IM0pScSt0UXpFeGJIb2tUY2FT?=
 =?utf-8?B?ekpTd1l0MnNoaTlwbWZQREdBT3Jkck1TbjU0ejBrUUJZTExaT3NRR043Rits?=
 =?utf-8?B?bnU3emlwLzNnaksrNzhzYjcrei83dWJBdWtoU2hQYXNlOFYrRlJNb0tOUyta?=
 =?utf-8?B?MnQyaU1mZlRrTlYxVmQydTJDdzVKVE83ZmRFU3dyM3BiMGIzUEFKV0ZrNUN3?=
 =?utf-8?B?ZDR4L1p0QU0xalg3b291R21lYU1OL2dmR3pXSG0xcWJPMGdTLy9xSSt6Z24y?=
 =?utf-8?B?SGxFdGRJSUVRWStiNmh4VGRhNzhlMGlWR1FzaWhlek5teW1jTFZFZk5SZzlj?=
 =?utf-8?B?aXljWiszZ0k4czMxT1JmeDdHemlrUnYyUk9sV29zYjAxUU14aS9yODVoblZN?=
 =?utf-8?B?US8yS243Qjk4WXlqdWhPU2xSVVZldXg3bFRwN0tmanZaZ1Y5YmZralM3ZDc3?=
 =?utf-8?B?WGhVSldLVDRnSXFSTlI3VWgxa3VHTytlZjJSc0lVYk5VcGZFUUdEU1BmNkdL?=
 =?utf-8?B?a3FPWUY3NVdhdDk0L1kvRnVORHpkb2NmclV6WnpoVG5qa3ppWXRVQ0xTMFZZ?=
 =?utf-8?B?WUhjZWNMakhFbGNnVlJvd1J4cmRieWU5WDJ0UFhzQzNoWXdJM3hwNmxxV01r?=
 =?utf-8?B?TTcvdWdJNVI5aHRsNk5vYk5pRklzMmtiVHc5cVpBNkUrQXpHN2dtY2R2R3R5?=
 =?utf-8?B?NXVzSlhXQW9LMHZyY3Z6VUJaUGNpY2FUMitvVUlmY1NMUHBHRDZHL0VJdis5?=
 =?utf-8?B?UUpqK2NNeFg4Y0hPejZUeU9nQXBjWlYvY00yditDeDlTb0MrdmxOck1QNHNJ?=
 =?utf-8?B?c0dSRmZEdW9xVXdXYjg4YTBLdjJBSENRNGhWeGpkbkhROTZSZWtiS3pjRDZw?=
 =?utf-8?B?U2ZaZEx6cUtnTHRIeHpNSTlwWTJKYTlhbFZScTZCZGtOYkNOcGRuLzg1Ym0v?=
 =?utf-8?B?WlMxdXhkdkJZdWdkRkh5bXlFMU1ReHBYejdDQVVFQkZpM3I1Y2dzaENSUFFL?=
 =?utf-8?B?NFNKK3hoU1dLcFZUT0RiMHZQM1R0MW1XZmR5OEtkVzdaajVVMWxKbEtyTDl3?=
 =?utf-8?B?bnZEWmJqdURUMTFTTUdBTlhwbkJySlhuUWJHamZDUll3djlFL1BkVmZ0U0pq?=
 =?utf-8?B?N2lCeWlIOTUwM2g3ZTRrTjYvdCtPV1J6ZUZXQjEzMmhhcnFlVHpJY0FvTlJw?=
 =?utf-8?B?QXZRT25aZHQzZDVqUGdPckFrMXFRTUNBMDZjV1k2RXh6Tlg0Q3FkaFAzYjdF?=
 =?utf-8?B?ejZEM1licmVVaXp4ckxGYUp6WEljNDFFUk43d0ZmT2FiYkZLemZscnRGUUda?=
 =?utf-8?B?V05IaTZrenhXV2s4N3hyVFliSGZSU0NuK2ZOQ1Btb2l6dVN2Tkl4VnlnY3hK?=
 =?utf-8?B?dzJ6UGFobHY4ektPTm9jM2cydUw2NW9zV2R5NWcrSTdLb3VlZUZFUEpUUXFV?=
 =?utf-8?B?bmhjTi9RdkR5MHh6RmZYUFZGWVFrejZoNW1DVHZ1Yktva0FKakZ2L1VaV251?=
 =?utf-8?B?RGxjT1MyVzArT1crbkwzczBFWENCS2RRZHJabXVKQW1lZGIyMzJITVhJcURu?=
 =?utf-8?B?RElDMUFMa3FrV0tNN0xLTVBmeEUwOUsxUFkyVkNoQVhxemJGdWJMaWdZNFB5?=
 =?utf-8?B?ZHoxZWZUTUo3RTJVNkNDUzN2dGVWdFdxRUc3Yk5EL3RaRFQzSGl2Z205T05t?=
 =?utf-8?B?SVlDRUpaK2tEVEs1eGJpYk15TUFOSWQ1cFVxMTN5aHhBY0lzaDFJTW43aFIr?=
 =?utf-8?B?UjJlaHhMV2R4dWVvYmsydHBDdXBFbktmQTAvSHFKV25CdVV5elJ3a3BoUHlI?=
 =?utf-8?B?dTJFTlZ2QWJYdTVPTGZtNUpQMWczSmhNZEpWTGwvbDVaUWF6Mkg3anFYdHZK?=
 =?utf-8?B?cENlempkM2V4eGFpV29lRThwTW1TRkRYMTNOSy9mOTF3d0ZhQmk5eUY2WGxy?=
 =?utf-8?B?VXdlMEJvMmZNNWxqbnYyVytSeGFHa0ZIZ3orZkVPNGlZUDJPWkRQTWtLKy9J?=
 =?utf-8?B?TEIwdEFDc1V3NkxvZ1N5clQ0ajl5eEdZaEQxUmlab0RxWmZyNnc4dnJTdHlQ?=
 =?utf-8?B?Qk54L0M1di9GWEszZk1vTkdwTjkraVVkNXNJdEovUnNRZFcrVmZKSDhVWHhk?=
 =?utf-8?Q?kfJVuqS+hHWCf3k80awmHREJ7swPZQWHvJ3gdyqC1YO3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR18MB5368.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5f12a8-60b5-4b2a-48dc-08dd816aa41a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 06:55:17.5614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k+e1rd2u5DzbbnW8ik9NWO4t656kNN5elDD+2YHHrIG+OV6uW26jCMbWWw5A6GW8JXFj44l7G2CYILsPzJzHQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8F489144C
X-Proofpoint-GUID: A1u8rEDUIcpGYqzBaU4tjQXMjwmpPQBj
X-Authority-Analysis: v=2.4 cv=T7GMT+KQ c=1 sm=1 tr=0 ts=68073d5b cx=c_pps a=e6lK8rWizvdfspXvJDLByw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=-AAbraWEqlQA:10 a=RpNjiQI2AAAA:8 a=M5GUcnROAAAA:8 a=KgxZQTYqAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=SFoedJshTpBDT7ZSl54A:9 a=QEXdDO2ut3YA:10 a=OBjm3rFKGHvpk9ecZwUJ:22 a=J70gtpi9w7iKWgri9Xi8:22
X-Proofpoint-ORIG-GUID: A1u8rEDUIcpGYqzBaU4tjQXMjwmpPQBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_03,2025-04-21_02,2024-11-22_01

PiA+IEZyb206IFNydWphbmEgQ2hhbGxhIDxzY2hhbGxhQG1hcnZlbGwuY29tPg0KPiA+IFNlbnQ6
IFdlZG5lc2RheSwgQXByaWwgMTYsIDIwMjUgMTE6NTQgQU0NCj4gPiBUbzogU2ViYXN0aWFuIE1h
dXJpdHNzb24gPHNtYUBuYXBhdGVjaC5jb20+OyB2aXJ0aW8tDQo+ID4gY29tbWVudEBsaXN0cy5s
aW51eC5kZXYNCj4gPiBDYzogbXN0QHJlZGhhdC5jb207IHBhYmVuaUByZWRoYXQuY29tOyBqYXNv
d2FuZ0ByZWRoYXQuY29tOw0KPiA+IHBhcmF2QG52aWRpYS5jb207IFNhdGFuYW5kYSBCdXJsYSA8
c2J1cmxhQG1hcnZlbGwuY29tPjsgTml0aGluIEt1bWFyDQo+ID4gRGFiaWxwdXJhbSA8bmRhYmls
cHVyYW1AbWFydmVsbC5jb20+OyBKZXJpbiBKYWNvYg0KPiA+IDxqZXJpbmpAbWFydmVsbC5jb20+
OyBTaGl2YSBTaGFua2FyIEtvbW11bGEgPGtzaGFua2FyQG1hcnZlbGwuY29tPg0KPiA+IFN1Ympl
Y3Q6IFJFOiBbUEFUQ0ggUkZDIHY0IDAvNF0gaW50cm9kdWNlIElQc2VjIE9wZXJhdGlvbiBpbg0K
PiA+IHZpcnRpby1uZXQNCj4gPg0KPiA+ID4gV2hhdCBhcmUgeW91ciB0aG91Z2h0cyBvbiBoYW5k
bGluZyBNVFUgYW5kIGZyYWdtZW50YXRpb24gZm9yIEVTUA0KPiBwYWNrZXRzPw0KPiA+IFdlIGRv
IG5vdCBwbGFuIHRvIGluY2x1ZGUgcG9zdCBJUHNlYyBmcmFnbWVudGF0aW9uIHN1cHBvcnQgaW4g
dGhpcw0KPiA+IHNlcmllcy4gRm9yIHRoaXMgc2VyaWVzLCB0aGUgZHJpdmVyIG9yIFNXIHN0YWNr
IG11c3QgcHJlLWZyYWdtZW50IHRoZQ0KPiA+IHBhY2tldCBhbmQgZW5zdXJlIHRoYXQgSVBzZWMg
b3BlcmF0aW9ucyBkbyBub3QgaW5jcmVhc2UgdGhlIHBheWxvYWQgc2l6ZQ0KPiBiZXlvbmQgdGhl
IE1UVSBsaW1pdC4NCj4gPiBUaGFua3MuDQo+IEhpLCB0aGFua3MhIElzIHRoZSBwbGFuIHRvIHVz
ZSBJQ01QIFBNVFUgbWVzc2FnZXMgZm9yIHRoaXM/IChhcyByZXF1ZXN0ZWQgYnkNCj4gUkZDNDMw
Mywgc2VjdGlvbiAzLjMuNCBhbmQgZnVydGhlciBkZXNjcmliZWQgaW4gUkZDNDMwMSwgc2VjdGlv
biA4LjIuMSkNCg0KVGhlIHNvZnR3YXJlIHN0YWNrIG5lZWRzIHRvIGVuc3VyZSBwYWNrZXRzIGFy
ZSBub3QgbGFyZ2VyIHRoYW4gdGhlIFBNVFUgYmVmb3JlIHNlbmRpbmcgdGhlbSB0byB0aGUgZGV2
aWNlLg0KVGhlIElQc2VjIG9mZmxvYWQgYmVpbmcgcHJvcG9zZWQgZm9yIHZpcnRpbyBpcyBpbiBh
Z3JlZW1lbnQgd2l0aCBSRkMgNDMwMyBhbmQgNDMwMSBzaW5jZSB0aGUgbGludXggeGZybQ0KZnJh
bWV3b3JrIGNoZWNrcyB0aGUgcGFja2V0IHNpemUgYWdhaW5zdCB0aGUgUE1UVSBhbmQgc2VuZHMg
SUNNUCBtZXNzYWdlcyB0byB0aGUgdXBwZXIgbGF5ZXIgaWYNCmZyYWdtZW50YXRpb24gaXMgbmVl
ZGVkLCB1c2luZyB0aGUgeGZybTQvNl90dW5uZWxfY2hlY2tfc2l6ZSBmdW5jdGlvbi4NClNvIGRl
dmljZSBkb2VzIG5vdCBleHBlY3QgdG8gc2VlIGNsZWFyIHRleHQgcGFja2V0cyBsYXJnZXIgdGhh
biBQTVRVLg0KDQpUaGUgY3VycmVudCB2aXJ0aW9fbmV0IGRldmljZSAgSVBzZWMgb2ZmbG9hZCBz
ZXJpZXMgZG9lcyBub3QgcHJvdmlkZSBwcmUvcG9zdCBmcmFnbWVudGF0aW9uIHN1cHBvcnQuDQpU
aGUgc3RhY2sgaXMgcmVzcG9uc2libGUgZm9yIHByb3ZpZGluZyB0aGUgcmlnaHQgY2xlYXIgdGV4
dCBzaXplIHBhY2tldCB0YWtpbmcgYWNjb3VudCB0dW5uZWwgYW5kIGVuY3J5cHRpb24gZXhwYW5z
aW9uLg0KDQpUaGFua3MuDQoNCj4gPiA+IEJyLCBTZWJhc3RpYW4NCj4gPiA+DQo+ID4gPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IFNydWphbmEgQ2hhbGxhIDxz
Y2hhbGxhQG1hcnZlbGwuY29tPg0KPiA+ID4gPiBTZW50OiBUdWVzZGF5LCBBcHJpbCA4LCAyMDI1
IDk6MzkgQU0NCj4gPiA+ID4gVG86IHZpcnRpby1jb21tZW50QGxpc3RzLmxpbnV4LmRldg0KPiA+
ID4gPiBDYzogbXN0QHJlZGhhdC5jb207IHBhYmVuaUByZWRoYXQuY29tOyBqYXNvd2FuZ0ByZWRo
YXQuY29tOw0KPiA+ID4gPiBwYXJhdkBudmlkaWEuY29tOyBzYnVybGFAbWFydmVsbC5jb207IG5k
YWJpbHB1cmFtQG1hcnZlbGwuY29tOw0KPiA+ID4gPiBqZXJpbmpAbWFydmVsbC5jb207IGtzaGFu
a2FyQG1hcnZlbGwuY29tOyBzY2hhbGxhQG1hcnZlbGwuY29tDQo+ID4gPiA+IFN1YmplY3Q6IFtQ
QVRDSCBSRkMgdjQgMC80XSBpbnRyb2R1Y2UgSVBzZWMgT3BlcmF0aW9uIGluDQo+ID4gPiA+IHZp
cnRpby1uZXQNCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBzZXJpZXMgZW5oYW5jZXMgdmlydGlvLW5l
dCBieSBhZGRpbmcgc3VwcG9ydCBmb3IgSVBzZWMgT3BlcmF0aW9uLg0KPiA+ID4gPiBUaGVzZSBw
YXRjaGVzIGFpbSB0byBleHRlbmQgdGhlIGNhcGFiaWxpdGllcyBvZiB2aXJ0aW8tbmV0LA0KPiA+
ID4gPiBlbmFibGluZyBpdCB0byBoYW5kbGUgSVBzZWMgb3BlcmF0aW9ucyBlZmZpY2llbnRseS4g
VGhpcyBlbmFibGVzDQo+ID4gPiA+IHRoZSBvZmZsb2FkaW5nIG9mIElQc2VjIHByb2Nlc3Npbmcs
IGJvdGggYmVmb3JlIHRyYW5zbWlzc2lvbiBhbmQNCj4gPiA+ID4gYWZ0ZXIgcmVjZXB0aW9uLCB0
aGVyZWJ5DQo+ID4gPiBwcm92aWRpbmcgaW5saW5lIG9mZmxvYWQgY2FwYWJpbGl0aWVzLg0KPiA+
ID4gPg0KPiA+ID4gPiBJdCBpcyB1c2luZyBuZXcgdmlydGlvIGJhc2ljIGZhY2lsaXRpZXMgb2Yg
Y2FwYWJpbGl0eSBhbmQgcmVzb3VyY2UNCj4gPiA+ID4gb2JqZWN0cy4gQmVsb3cgaXMgYSBzdW1t
YXJ5IG9mIHRoZSBjaGFuZ2VzIGludHJvZHVjZWQ6DQo+ID4gPiA+DQo+ID4gPiA+IFBhdGNoMToN
Cj4gPiA+ID4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIHRoZSBmb3VuZGF0aW9uYWwgc3VwcG9ydCBm
b3IgSVBzZWMgd2l0aGluDQo+ID4gPiA+IHRoZSB2aXJ0aW8tbmV0IGZyYW1ld29yaywgb3V0bGlu
aW5nIHRoZSBuZWNlc3NhcnkgY2FwYWJpbGl0aWVzIGFuZA0KPiA+ID4gPiByZXNvdXJjZSBvYmpl
Y3RzIGZvciBJUHNlYyBvcGVyYXRpb25zLg0KPiA+ID4gPg0KPiA+ID4gPiBQYXRjaDI6DQo+ID4g
PiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBzZWxlY3RvciBhbmQgYWN0aW9uIG5lY2Vz
c2FyeSBmb3INCj4gPiA+ID4gSVBzZWMgcHJvY2Vzc2luZywgbGV2ZXJhZ2luZyBmbG93IGZpbHRl
ciBhY3Rpb25zLg0KPiA+ID4gPg0KPiA+ID4gPiBQYXRjaDM6DQo+ID4gPiA+IFRoaXMgcGF0Y2gg
aW50cm9kdWNlcyBuZXcgZmllbGRzIGluICJzdHJ1Y3QgdmlydGlvX25ldF9oZHIiIHRvIHRvDQo+
ID4gPiA+IHN1cHBvcnQgSVBzZWMgZnVuY3Rpb25hbGl0eS4NCj4gPiA+ID4NCj4gPiA+ID4gUGF0
Y2g0Og0KPiA+ID4gPiBUaGlzIHBhdGNoIHNwZWNpZmllcyB0aGUgcmVxdWlyZW1lbnRzIGZvciBi
b3RoIHRoZSBkZXZpY2UgYW5kIHRoZQ0KPiA+ID4gPiBkcml2ZXIgdG8gc3VwcG9ydCBJUHNlYyBv
cGVyYXRpb25zLg0KPiA+ID4gPg0KPiA+ID4gPiBUaGVzZSBlbmhhbmNlbWVudHMgYXJlIGZvciBw
cm92aWRpbmcgc3VwcG9ydCBmb3IgSVBzZWMgd2l0aGluIHRoZQ0KPiA+ID4gPiB2aXJ0aW8tbmV0
IGRldmljZS9kcml2ZXIsIGltcHJvdmluZyBzZWN1cml0eSBhbmQgcGVyZm9ybWFuY2UgZm9yDQo+
ID4gPiA+IHZpcnR1YWxpemVkDQo+ID4gPiBlbnZpcm9ubWVudHMuDQo+ID4gPiA+IFdlIGJlbGll
dmUgdGhlc2UgYWRkaXRpb25zIHdpbGwgc2lnbmlmaWNhbnRseSBiZW5lZml0IHVzZXJzIHdobw0K
PiA+ID4gPiByZWx5IG9uIHZpcnRpby1uZXQgZm9yIHNlY3VyZSBkYXRhIHRyYW5zbWlzc2lvbi4N
Cj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBzZXJpZXMgcmVmZXJlbmNlcyB0aGUgVmlydGlvLWNyeXB0
byBJUHNlYyBzZXJ2aWNlIG9wZXJhdGlvbg0KPiA+ID4gPiBjYXBhYmlsaXRpZXMgYW5kIHJlc291
cmNlIG9iamVjdHMgZGF0YSBzdHJ1Y3R1cmVzLCBhbmQNCj4gPiA+ID4gY3J5cHRvZ3JhcGhpYyBh
bGdvcml0aG0gZGVmaW5pdGlvbnMgdG8gYXZvaWQgZHVwbGljYXRpb24sIGhvd2V2ZXINCj4gPiA+
ID4gdGhlIGFkbWluIGNvbW1hbmQgdHlwZSB2YXVsZSBkaWZmZXJzIGJldHdlZW4gVmlydGlvLQ0K
PiA+ID4NCj4gPiA+IHMvdmF1bGUvdmFsdWUNCj4gPiA+DQo+ID4gPiA+IGNyeXB0byBhbmQgVmly
dGlvLW5ldC4NCj4gPiA+ID4NCj4gPiA+ID4gZGVwZW5kcy1vbjoNCj4gPiA+ID4gaHR0cHM6Ly91
cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19saW5rcHJvdGVjdC5j
DQo+ID4gPiA+IHVkDQo+ID4gPGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91
cmw/dT1odHRwcy0zQV9fbGlua3Byb3RlY3QuY3VkDQo+ID4gPj4gPiA+IGFzDQo+ID4gPiA+IHZj
LmNvbV91cmwtM0ZhLTNEaHR0cHMtMjUzYS0yNTJmLTI1MmZsb3JlLmtlcm5lbC5vcmctMjUyZnZp
cnRpby0yRA0KPiA+ID4gPiAmZA0KPiA+ID4gPiA9RA0KPiA+ID4gPg0KPiA+ID4NCj4gd0lGQWcm
Yz1uS2pXZWMyYjZSMG1PeVBhejd4dGZRJnI9Rmo0T29ENWhjS0ZwQU5oVFdkd1F6alQxSnBmNw0K
PiA+ID4gdmVDNTI2M1Q0DQo+ID4gPiA+DQo+ID4gPg0KPiA3SlZwbmMmbT1xZVEzOGNrZzlDVjlY
WWpxNmxUTzRlQ1NqMlVPSTJuOXlZcHFaMWV3WkFLcFkxVHlNUFYNCj4gPiA+IGFKR0x0NW9tN0UN
Cj4gPiA+ID4gMVNhJnM9OG5HZC1BV3RySWtHQUZWd1RtSTFyaF9ESThkRGFfaGJvMXlxdjMtcnRB
WSZlPQ0KPiA+ID4gPiBjb21tZW50JTJmMjAyNTA0MDgwNzM1MTIuMTc4MzY0MS0xLQ0KPiA+ID4g
PiBzY2hhbGxhJTQwbWFydmVsbC5jb20lMmYmYz1FLDEsZTBIMU5HMGJnb09YRFRqZElOeWNrOEVz
UW8zaUotDQo+ID4gPiA+IHRPWVFZV1BNUERMcEF4bHlad0l4ZmhubkNrVEpnWm5BMVozaE01YTRC
RS1RLQ0KPiA+ID4gPiBhSXFLQ05fakpFSGNPbkk0UHI1eTM1MndYUFY3QzlsMXowanBJaHVsbyZ0
eXBvPTENCj4gPiA+ID4gZGVwZW5kcy1vbjoNCj4gPiA+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLnBy
b29mcG9pbnQuY29tL3YyL3VybD91PWh0dHBzLTNBX19saW5rcHJvdGVjdC5jDQo+ID4gPiA+IHVk
DQo+ID4gPGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0z
QV9fbGlua3Byb3RlY3QuY3VkDQo+ID4gPj4gPiA+IGFzDQo+ID4gPiA+IHZjLmNvbV91cmwtM0Zh
LTNEaHR0cHMtMjUzYS0yNTJmLTI1MmZsb3JlLmtlcm5lbC5vcmctMjUyZnZpcnRpby0yRA0KPiA+
ID4gPiAmZA0KPiA+ID4gPiA9RA0KPiA+ID4gPg0KPiA+ID4NCj4gd0lGQWcmYz1uS2pXZWMyYjZS
MG1PeVBhejd4dGZRJnI9Rmo0T29ENWhjS0ZwQU5oVFdkd1F6alQxSnBmNw0KPiA+ID4gdmVDNTI2
M1Q0DQo+ID4gPiA+DQo+ID4gPg0KPiA3SlZwbmMmbT1xZVEzOGNrZzlDVjlYWWpxNmxUTzRlQ1Nq
MlVPSTJuOXlZcHFaMWV3WkFLcFkxVHlNUFYNCj4gPiA+IGFKR0x0NW9tN0UNCj4gPiA+ID4gMVNh
JnM9OG5HZC1BV3RySWtHQUZWd1RtSTFyaF9ESThkRGFfaGJvMXlxdjMtcnRBWSZlPQ0KPiA+ID4g
PiBjb21tZW50JTJmMjAyNTA0MDExOTU2NTUuNDg2MjMwLTEtDQo+ID4gPiA+DQo+ID4gPg0KPiBr
c2hhbmthciU0MG1hcnZlbGwuY29tJTJmJmM9RSwxLHRncDd3SGV5SHFIbGpvMDRESFRuU2toTUtK
ckgxbHZvDQo+ID4gPiB2LQ0KPiA+ID4gPiBVS1BvZF9samQwTnJJVU9zNVUtVFZQWU1heHlwYWtZ
b210OTUtDQo+ID4gPiA+IFZwY2dzcklrMzZqam5vamJQZUlrQ2tVejJIeDQwZktCUUhfbmZRU0x5
JnR5cG89MQ0KPiA+ID4gPg0KPiA+ID4gPiB2MjoNCj4gPiA+ID4gLSBBZGRyZXNzZWQgdGhlIHJl
dmlldyBjb21tZW50cyBmcm9tIFBhcmF2IFBhbmRpdC4NCj4gPiA+ID4gdjM6DQo+ID4gPiA+IC0g
SW50cm9kdWNlZCBWSVJUSU9fTkVUX0hEUl9GX1NFQ1VSSVRZX1NBX1NPRlRfRVhQSVJZX1dBUk4N
Cj4gZmxhZyBpbg0KPiA+ID4gdGhlDQo+ID4gPiA+IHZpcnRpb19uZXRfaGRyOmZsYWdzLg0KPiA+
ID4gPiAtIEFkZHJlc3NlZCB0aGUgcmV2aWV3IGNvbW1lbnRzIGZyb20gUGFyYXYgUGFuZGl0Lg0K
PiA+ID4gPiB2NDoNCj4gPiA+ID4gLSBSZWJhc2VkIHRoaXMgc2VyaWVzIG9uIFZJUlRJT19ORVRf
Rl9PVVRfTkVUX0hFQURFUiBwYXRjaC4NCj4gPiA+ID4NCj4gPiA+ID4gU3J1amFuYSBDaGFsbGEg
KDQpOg0KPiA+ID4gPiAgIHZpcnRpby1uZXQ6IEFkZCBJUHNlYyBvcGVyYXRpb24sIGNhcGFiaWxp
dGllcyBhbmQgcmVzb3VyY2Ugb2JqZWN0cw0KPiA+ID4gPiAgIHZpcnRpby1uZXQ6IEFkZCBuZXcg
ZmxvdyBmaWx0ZXIgc2VsZWN0b3IgYW5kIGFjdGlvbiBmb3IgSVBzZWMNCj4gPiA+ID4gICB2aXJ0
aW8tbmV0OiBleHRlbmQgdmlydGlvX25ldF9oZHIgZm9yIElQc2VjIHN1cHBvcnQNCj4gPiA+ID4g
ICB2aXJ0aW8tbmV0OiBBZGQgSVBzZWMgb3BlcmF0aW9uIGRldmljZSBhbmQgZHJpdmVyIHJlcXVp
cmVtZW50cw0KPiA+ID4gPg0KPiA+ID4gPiAgZGV2aWNlLXR5cGVzL25ldC9kZXNjcmlwdGlvbi50
ZXggICAgICAgIHwgMjA2DQo+ICsrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+ID4gPiAgZGV2
aWNlLXR5cGVzL25ldC9kZXZpY2UtY29uZm9ybWFuY2UudGV4IHwgICAxICsNCj4gPiA+ID4gIGRl
dmljZS10eXBlcy9uZXQvZHJpdmVyLWNvbmZvcm1hbmNlLnRleCB8ICAgMSArDQo+ID4gPiA+ICAz
IGZpbGVzIGNoYW5nZWQsIDIwMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+ID4g
Pg0KPiA+ID4gPiAtLQ0KPiA+ID4gPiAyLjI1LjENCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBEaXNj
bGFpbWVyOiBUaGlzIGVtYWlsIGFuZCBhbnkgZmlsZXMgdHJhbnNtaXR0ZWQgd2l0aCBpdCBtYXkg
Y29udGFpbg0KPiA+ID4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGludGVuZGVkIGZvciB0aGUg
YWRkcmVzc2VlKHMpIG9ubHkuIFRoZQ0KPiA+ID4gaW5mb3JtYXRpb24gaXMgbm90IHRvIGJlIHN1
cnJlbmRlcmVkIG9yIGNvcGllZCB0byB1bmF1dGhvcml6ZWQNCj4gPiA+IHBlcnNvbnMuIElmIHlv
dSBoYXZlIHJlY2VpdmVkIHRoaXMgY29tbXVuaWNhdGlvbiBpbiBlcnJvciwgcGxlYXNlDQo+ID4g
PiBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZGVsZXRlIHRoaXMgZS1tYWlsIGZy
b20geW91ciBzeXN0ZW0uDQo+IERpc2NsYWltZXI6IFRoaXMgZW1haWwgYW5kIGFueSBmaWxlcyB0
cmFuc21pdHRlZCB3aXRoIGl0IG1heSBjb250YWluIGNvbmZpZGVudGlhbA0KPiBpbmZvcm1hdGlv
biBpbnRlbmRlZCBmb3IgdGhlIGFkZHJlc3NlZShzKSBvbmx5LiBUaGUgaW5mb3JtYXRpb24gaXMg
bm90IHRvIGJlDQo+IHN1cnJlbmRlcmVkIG9yIGNvcGllZCB0byB1bmF1dGhvcml6ZWQgcGVyc29u
cy4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcw0KPiBjb21tdW5pY2F0aW9uIGluIGVycm9yLCBw
bGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIGRlbGV0ZSB0aGlzDQo+IGUt
bWFpbCBmcm9tIHlvdXIgc3lzdGVtLg0K
