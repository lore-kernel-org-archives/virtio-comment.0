Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB9C748A
	for <virtio-comment@lists.linux.dev>; Wed, 11 Sep 2024 05:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726031202; cv=fail; b=m68m70Cgii2TAc24H+iTHT+nVl+FnVkTyTrpxqF3aDcdk2n7KSsECr8VB9csP9dmfTmcNPM7qvcWGepJ9iVX1Vup9I0qMAx39wmvvOKlKbylIbkxvjhuMNG6/LCq3lW9zXxqEbg5+5fEscJhJu9mv9azEVdJZltNnwZqoPR9rrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726031202; c=relaxed/simple;
	bh=s/lIvPIUDpIDNnMsfSFLXb8XMJoBWGYr+Tv3tPuFHIA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZiPQEt+VbveF2kIrsGlTxrklel40BkiEd9XQKmJPAlG1OjZc1vC8tyM/UsY/MSu3Z2GQgbHvboy6d0sEtAp0A/JDIpm98W+fudepmYyjlxy8qveE10IGbNMjLpzwp3Hc+d3OdSgZWCMIu5doMELyrBciQKE/9Vg0r3/tvuA6wZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rME51IwW; arc=fail smtp.client-ip=40.107.100.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rME51IwW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0AT1/ibqs0jcmSKYmZCpPIcz/2Il1aOb0/i9VhTZKQLsnAed59+7iTgD0filZAk98Z+eMSzOK7Fymy4PXmohQXsG/MEo0SMRYTwgoULqxMHa/CnR92ZYBEwbgkzjKJWzE5LMz0B0YhVa9PzHHfdnxM8GXC7+H0Es+wmLS9NG2XhY22SzOoodClbjHxO8gR5EksNCHx+njbhD0BT42o+uodnXu9j3YVAU5A7pc5yzZphYt9uLr+M5T5+sFFht/e2UOze2XFswq7aePGAmWmsAyNrpr8QdxpuP5LbBYmgM8CbTYa0LcsftCZ4xP7n91HoReuA6B7t5Ts8ermoVFoOEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/lIvPIUDpIDNnMsfSFLXb8XMJoBWGYr+Tv3tPuFHIA=;
 b=uhGcg2DY9aKxWqaPlB1ePy6sv8X6f4syxmf3MhYcQc8W3tJIuc26KtaMiZWKOEQdidUMmtEvEEHdWIEQyE8ti2mIdKD8YcEorI0aut1KVny0vAV5lNSWSchvlcoyxHn0GMkx+Y7T0zDdJbN/k7Y0HArZAoBNG5zxBKoVBKPwacbKR72+/wWsHDgK9JMsmWfMFSA/ipFi5UlnP3bUHjV3PJNhio7czG9M8MvTesVFfeKhiZGPx+P6S2T8/nn16WT7nAqwSTAL61sTfzuRNWDXpU8cdjbyEjssgLJnIqY+MWeEAEZ3xyjyC2nATJIHd7lDvM8bB/03+i3gTH0F3zeBQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/lIvPIUDpIDNnMsfSFLXb8XMJoBWGYr+Tv3tPuFHIA=;
 b=rME51IwW+q0PSakbKJo5kBDD02fFO4/F2ilTxG4lPuKcvNYTeoYvpKwc28gwR6VjnqAEsmjCEg7kIUmaTJU7LwKGAyPb7/Vyr2hDXU3ddPIeQnD8U/SonTeeFl/sC6aOVlZA1NvnH5JlniFZal5E0o6PknLZWMz0XqAuEpKIwK9T2+fFQAz7HU7UT1qz9p/Nrua4ksp3Y/4fI8Dju9OwjoWFaqtqso9gKlZtRbOjjyws6IqbekGxbm5zStuYkvg1oVIOwqr/SIPLWAtS8zwxz4yGoB+iCrjYdKstFPMmhkSEV7g5wf5GIHFz6UoNDbZ1SoBeBbNbznhrx2L0wJclOw==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by PH7PR12MB7234.namprd12.prod.outlook.com (2603:10b6:510:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 05:06:36 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 05:06:36 +0000
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: Zhu Lingshan <lingshan.zhu@amd.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] admin: Enable driver to send admin commands before
 DRIVER_OK
Thread-Topic: [PATCH] admin: Enable driver to send admin commands before
 DRIVER_OK
Thread-Index:
 AQHbA6QB1dLNvHRBLkyvjpsHR6lgt7JRWCUAgAAGYtCAABwqgIAAcPQQgAALNQCAAABssIAAClYAgAABBACAAAB/0IAABayAgAAAPrA=
Date: Wed, 11 Sep 2024 05:06:36 +0000
Message-ID:
 <IA0PR12MB87136A4FBAB1ECAAD2AC0CDBDC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240910170723.44537-1-parav@nvidia.com>
 <20240910142850-mutt-send-email-mst@kernel.org>
 <IA0PR12MB87136FC9671ABFF7123A82CADC9A2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240910162247-mutt-send-email-mst@kernel.org>
 <IA0PR12MB8713AC1D273671DF459FA254DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <8a42e214-59b1-4085-aec0-0f31be885525@amd.com>
 <IA0PR12MB871350EE73BFB2B8B60B7E97DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <CACGkMEtUvJhAq9Y-hZ8NroupJgarYhB8qz-cLXNQYrvnoGKgbQ@mail.gmail.com>
 <5d0cf855-ead0-46a4-8221-d41c0a3be15f@amd.com>
 <IA0PR12MB871329260A003AF902C78956DC9B2@IA0PR12MB8713.namprd12.prod.outlook.com>
 <CACGkMEuzWu9XZj00VQCeejvCe+XQYQntONUapo7CStDcXkyfdA@mail.gmail.com>
In-Reply-To:
 <CACGkMEuzWu9XZj00VQCeejvCe+XQYQntONUapo7CStDcXkyfdA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|PH7PR12MB7234:EE_
x-ms-office365-filtering-correlation-id: 3db14796-bc70-4fc5-cbdf-08dcd21f82fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cENrU1VnYzM2eE14S1RrMThid3R0eStJSVVTR2hGdm0yZ2dOSyt4LzZQWi9m?=
 =?utf-8?B?YTdvSjJtK1lzRFp0MExrQ0ZEVkVLYXNEOXcweE40dFpuQ1FXcmdjeDF5bHZj?=
 =?utf-8?B?VmtVb1ZDN08waWZoYzI5Nys0SGNNZjc0UTRRRk5HWittM1NKM0VJcFdEL0RU?=
 =?utf-8?B?MWNFOXJqTThUb3BLdXcwOWxUVTFjYnhYSlVycHNkUXNGSUJ3enlGeWs0RFg0?=
 =?utf-8?B?bmZjd1NXVEg3U1VTbi92K3dGOXNMWDdzc3RXdDZvVVlhdzByT1BIQU9CNHl1?=
 =?utf-8?B?NHo1aW5YcTdLSUdQbGFER0hJQVQwMDMrKy9vbHUrZi9GL1JqdnpwVndxMWov?=
 =?utf-8?B?SDZMR2dIa2xkNVNCd2UrSUZHaVM5MmpaWWxpZDlCQVA2NWZJR0NhaWRsbHA3?=
 =?utf-8?B?b1hsck9kUGlYSFhMVWF5WUFtTytqR3h5L2J1RGljYy9sQmdXK2tRL1BLdXpV?=
 =?utf-8?B?VE9nYmpNWXBsSnowOXpEZEJGN3I1dlViaVBKeGljRkZ3eXcwWHlMQWhZZGJV?=
 =?utf-8?B?Ly9UVE1FaEQweUltRUU1YzBOVFBZc09aZEFFWWFTaVlITExBZHNoOWVJN1Zw?=
 =?utf-8?B?a2ZCWVRNK2xBUWowaU1abmQ3aUU0MDVoMi9LdHJqdnQwb2dTVTJ1Z3R3bENB?=
 =?utf-8?B?bWM5WlhIWnpJY0ZFSEJPUXFMeVlGZFFsRHI1VUFzQ05tblRUMXJMZmxaWXk3?=
 =?utf-8?B?VUJBK2x5WVZlZkcrT2R3OFNHaHpqU2twRGdIZmx4bnJ0cG9ON1ZUdjdZc1pS?=
 =?utf-8?B?ZXVrZ20zK0dKcXQwcGhseGdCNkZyR3ZwYU5Zek9xTW9JLzQwc2hsd3IvRE9H?=
 =?utf-8?B?MldtQ2lSeUN4enQzSEoyZVl2WXRUQWpUTkJ6SDRpaFhOOUpUNTF2WVoxSzlH?=
 =?utf-8?B?Z1Z3WGkvanI5N0gwZzE0TWRXQ0xnUmFnSWhQbW9SNXZEOVdJMU5BeVIwMG9L?=
 =?utf-8?B?RndSZWdFYjFMUXU1VkhvVTRucTRMdXlpUXkwZTlnLy9Sc1BDaTExckhNbXBp?=
 =?utf-8?B?SVVJaG9ZaUltVXpRV1A3Y1kyTFZGdkNIdmM3UTBiZUFrcm9oOGJuY2JGcXM3?=
 =?utf-8?B?NWRrS2JJZlc1Q3BwVVBUdkV4ekQ3Uk1iT3pFbWFQTVoxb0Z3c3JhT0pUVUlD?=
 =?utf-8?B?STZENkppeFpJUGdOMzQzK3dvM2tkV1RjSWRoUEZMTi9OQUk2QmxQOEZFd0Y1?=
 =?utf-8?B?b1RtRHV4YmNtalFISEQ2N3RDc1BiUzhISy9xWjdKbVExRWdKT2R5dTd0UndV?=
 =?utf-8?B?TFE4bm4ybm4zS2t2bWdEaUI5SGFRdktUYzVYWExGRVZvZHA0MGdLVTJVbmVr?=
 =?utf-8?B?dk5kQ3U3dlU1LzBiOWlrSnk1SVZCdjV1N3JkNWNSWVFPNzlXK0ptbHdnTERy?=
 =?utf-8?B?TlZCTERkTFpZQWRiTW1DV3RjNkxmZ2FtRkwyMFNkand0Z0EvMUROU1ZzZTRk?=
 =?utf-8?B?eTRwMEdBUk9QZHJGR0oySy8xNHpKbFlhNGgyeEVBWmVJNHNtOXNLd1Jrcmc0?=
 =?utf-8?B?RVptcm1naVc3M2N4OUUwUzVQbVZnd00rKzB2cDRlRTF6ZmZRR0xKR2ppN3Bm?=
 =?utf-8?B?T1dDU2FnOHJpTVQ0MGpCYUV5TzE0Y0VrRlIrUW9HQjdkRWJzL0VlL1RiZjZW?=
 =?utf-8?B?UDBjVUJOMkVoWEp2UWhQR2c3bmt0bW5LSzlFT1YvWk10TEJoQW96c3RHVEFR?=
 =?utf-8?B?RTRjS203aWJxQytIRmlDaWtIRjBrMHRRL3E5MHZ1OG4zbE5oeDI3OTdka3lC?=
 =?utf-8?B?MlByWXVDMGxSOHdDZm1hdEZyNWJ5M09IeXNIc0h5SzJxZUVka3BYcVVIKzV4?=
 =?utf-8?B?QnNiRi83K3VPeWE2MzAzemF0MEVNTWg2TVVyNzJJaE9KQmJIUWJxYWhFczhl?=
 =?utf-8?B?UUIzWUIvTDJSOGRlUnhzLzFJUmY4ODlYTDNuN1RTRlYrRmc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TEhwZm1NYmpXYXJOTzQ5RzRTNGtSS3U0cFdpMWRtRmF6K1huVzdoWi9HMGNj?=
 =?utf-8?B?NHp6MEtZaDM0bVFubExjQnFPVERsSytwYUVHZEJBcU14dWNYbktnVVAyb0tF?=
 =?utf-8?B?SFJCbVUzUFk0dTZMaS9LbjU1eTlBSGU0Q09MSlBRYTluNS82blZwZmtCems1?=
 =?utf-8?B?L1d2S3F3UjRLRDFQOU9rQWw1eTZDbkdpV1dmNStqTlBtdDZ5dUR5SDdiQ25Y?=
 =?utf-8?B?cUVaTmdtbmNSL0RYeVhmbFQ5NXVsZFU3VUljY0c2cVUyeGZiQjdNTXZ5Zkgx?=
 =?utf-8?B?eFhwdlIwMkFhVHJSN2pXaXFnTFhyMHF2WkdDMk9RVUo1S2pvdTJ5R3VBTldB?=
 =?utf-8?B?V2grRm9KcW1lS2J5VFU2VFZMczJrSXpoRjZEUnFrRU9EMDFPTGdaait1bE10?=
 =?utf-8?B?UWNZTUd1c3pRU0xUR055QXBSOXFJS0hxRGd2emIwWHBtV3hqeVJFNVBwUXBs?=
 =?utf-8?B?MU5EY056NHp1LzBuWkFBNStTckZEL3dWT3dSYTdwTWdUdm9rOTg3Vi9VOExJ?=
 =?utf-8?B?ZDUzQlFOSHpmSUhRTjJaZ2lRV0NSM2FSeDd0c3A3YnZPWVdzRVNKNVpZVWtW?=
 =?utf-8?B?bnpQUi9nbkVTc3JQZDRvNHZPbzhqL1NqRm84a0hiNVFkKzloTEU1VVJvbTMv?=
 =?utf-8?B?WTZLK2IwdEYvM2pRdkUxaVpSMGtad1JvbzQ1WUV3RWIwQmRpbCtFYnR4TUZo?=
 =?utf-8?B?S21MdUpVSlNieHE5cHcyemZaK1gxU21EcEVGV3BpdFZ5SHBBSkxmZm1jSWVp?=
 =?utf-8?B?S2RZV2dYMmZWSUZSekI5Y1VSVnN0a2k1RzEydU9oUmFMcDdFbmRvcThrbFFX?=
 =?utf-8?B?cVNyMFM1bjZBSUFoNXNKdDBGWm1qamJPU1BhbEVjdmZQRVlkcHR5Yno0T1JW?=
 =?utf-8?B?a09maVJNeTRJeHBuWjlBanpBQmhCdTluWXZtbCtjbVJ2dEVvNS9IOUljUmZ5?=
 =?utf-8?B?SE0yVHBZVE42bTdRWTVyTFNoM0hGUUFFNFFPZXgzZkVzdk9Kd1JiVXBsbzZB?=
 =?utf-8?B?M0JON3c0MXFjQ3JWUitubTk5K3ArdG9HWng5ajE1NFpPdnRDTHdHUmkySHE1?=
 =?utf-8?B?VHhZci9lWGtQU3JCK213QWIwOStrZ2Y2bjBEa3pDdnBnZXl6T2xMY1RBZXFC?=
 =?utf-8?B?RGZFcTRxNG5Yd3g0Z2wrTitydmlRNDFneDV6eE1DbUN0SnhZUnJYTlhOSFNY?=
 =?utf-8?B?ZkZVQmdhV2hleVlpemdMQUFnemgwZWQ5YllZZ1NqdlQ5WU84MFlKUXdCaWIv?=
 =?utf-8?B?djZrVHEzRXNsTkdlSzBjNXRnQVRFZDN0QlB2dlBaSHlqWkZNb3F3WEhncHE3?=
 =?utf-8?B?dEtxZ1pQZXRkQ3hQak8vdzVKNVA3UzZXTEw1VHZxZElDUDZmMHM3UkJTVlRL?=
 =?utf-8?B?S0pWTzFpU2k3eit1VGFmQUh1RDltTTZTTUhTTXJNckZSQUhxdmxzZWxBUm1L?=
 =?utf-8?B?SXJLQnR1RDYrc1lxdUJvcDFCTytRRWo5MDZQcWIydTZhS2J3THlQQ083NmJn?=
 =?utf-8?B?ZGJmQ3VwbmV1djlVZmNMLzNYRjl6WnFIQzYyWjJSTlZUUnY2N1Z4bXhIMEpT?=
 =?utf-8?B?TVJUL3lLTVhUWFUrN2pOOVNZYXFIUGtjVklJV2MyRzEyRHFyZDRkdThCanN5?=
 =?utf-8?B?Z0pldFJybGg4dVFUR0FtQTd5VC9UTUJZdkpjQ3VMTzFVR1RyNFprU244M1BO?=
 =?utf-8?B?aDdENDJGS1lFcEpHMUlOa2ExQ1FpVXhmZGFJMjJYTVljdG11RFBwdUowQm5l?=
 =?utf-8?B?QkQ0eDBPMlVHUnp2SEhESmpDSU5UZEhNYWlqSHJISlFPUXc2Q2p4eFlXN2RO?=
 =?utf-8?B?UVAvNjVQMTdhdDV3VUNONWFEZllFZFpSMW1oYjdhUE1PNHJyL0JWdWx5UFBT?=
 =?utf-8?B?WHlVSHVnOHdLaXpQQXcwd3BWTnQvUEhOTWxJeHRLSHVud0JiVkhwQkNJRExv?=
 =?utf-8?B?K2FJR2g4WVI1NSt4RVJicm5ud2hlYnJDYnROdmtzUU11UzVlMStzQzdMakV1?=
 =?utf-8?B?ZW1KOVRxUC9ZRGlHR1c4dm9TTXE5ZXBMLy9SdEkwTTNPZGs2dWFrekhnMGxl?=
 =?utf-8?B?ZFlpQVI4UHJHR21lL3UvR1VhZUFXY3BJS1RxRmFsSkVIM0ptWlg5QzV4NStE?=
 =?utf-8?B?ZU05aDVCdDZFeFlYSE5DUHRsYUZWOGRVcitlQWRwdThWTTJ0Snd5emNRRG9o?=
 =?utf-8?Q?3lnh6cwu6iA9yh0z6pmku4e8TdBTQcY1WemsKGCJudYZ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db14796-bc70-4fc5-cbdf-08dcd21f82fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 05:06:36.2765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: id3pkOWmdhn0ePhIeu+6c98jh5sBp4YxEkAIbKL6QQo3BihPUyjZbDEbXPKotH+y2VUr1GnuXxraXmHpYBNFew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7234

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogV2Vk
bmVzZGF5LCBTZXB0ZW1iZXIgMTEsIDIwMjQgMTA6MzQgQU0NCj4gDQo+IE9uIFdlZCwgU2VwIDEx
LCAyMDI0IGF0IDEyOjQ14oCvUE0gUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPiB3cm90
ZToNCj4gPg0KPiA+DQo+ID4gPiBGcm9tOiBaaHUgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBhbWQu
Y29tPg0KPiA+ID4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTEsIDIwMjQgMTA6MTIgQU0N
Cj4gPiA+DQo+ID4gPiBPbiA5LzExLzIwMjQgMTI6MzggUE0sIEphc29uIFdhbmcgd3JvdGU6DQo+
ID4gPiA+IE9uIFdlZCwgU2VwIDExLCAyMDI0IGF0IDEyOjEy4oCvUE0gUGFyYXYgUGFuZGl0IDxw
YXJhdkBudmlkaWEuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+Pg0KPiA+ID4gPj4+IEZyb206
IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGFtZC5jb20+DQo+ID4gPiA+Pj4gU2VudDogV2Vk
bmVzZGF5LCBTZXB0ZW1iZXIgMTEsIDIwMjQgOTozMCBBTQ0KPiA+ID4gPj4+IFRvOiBQYXJhdiBQ
YW5kaXQgPHBhcmF2QG52aWRpYS5jb20+OyBNaWNoYWVsIFMuIFRzaXJraW4NCj4gPiA+ID4+PiA8
bXN0QHJlZGhhdC5jb20+DQo+ID4gPiA+Pj4gQ2M6IHZpcnRpby1jb21tZW50QGxpc3RzLmxpbnV4
LmRldjsgY29odWNrQHJlZGhhdC5jb207IFNoYWhhZg0KPiA+ID4gPj4+IFNodWxlciA8c2hhaGFm
c0BudmlkaWEuY29tPg0KPiA+ID4gPj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGFkbWluOiBFbmFi
bGUgZHJpdmVyIHRvIHNlbmQgYWRtaW4gY29tbWFuZHMNCj4gPiA+ID4+PiBiZWZvcmUgRFJJVkVS
X09LDQo+ID4gPiA+Pj4NCj4gPiA+ID4+Pg0KPiA+ID4gPj4+DQo+ID4gPiA+Pj4gT24gOS8xMS8y
MDI0IDExOjM3IEFNLCBQYXJhdiBQYW5kaXQgd3JvdGU6DQo+ID4gPiA+Pj4+PiBGcm9tOiBNaWNo
YWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPg0KPiA+ID4gPj4+Pj4gU2VudDogV2VkbmVz
ZGF5LCBTZXB0ZW1iZXIgMTEsIDIwMjQgMjowNiBBTQ0KPiA+ID4gPj4+Pj4NCj4gPiA+ID4+Pj4+
IE9uIFR1ZSwgU2VwIDEwLCAyMDI0IGF0IDA3OjAxOjA4UE0gKzAwMDAsIFBhcmF2IFBhbmRpdCB3
cm90ZToNCj4gPiA+ID4+Pj4+Pj4gRnJvbTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0
LmNvbT4NCj4gPiA+ID4+Pj4+Pj4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTEsIDIwMjQg
MTI6MDIgQU0NCj4gPiA+ID4+Pj4+Pj4NCj4gPiA+ID4+Pj4+Pj4gT24gVHVlLCBTZXAgMTAsIDIw
MjQgYXQgMDg6MDc6MjNQTSArMDMwMCwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+ID4gPj4+Pj4+
Pj4gQ3VycmVudGx5IHRoZSBkcml2ZXIgY2FuIG9wZXJhdGUgYWRtaW5pc3RyYXRpb24gY29tbWFu
ZHMNCj4gPiA+ID4+Pj4+Pj4+IHVzaW5nIGFkbWluaXN0cmF0aW9uIHZpcnRxdWV1ZXMuIEFkbWlu
aXN0cmF0aW9uIHZpcnRxdWV1ZXMNCj4gPiA+ID4+Pj4+Pj4+IG11c3QgYmUgZW5hYmxlZCBiZWZv
cmUgaXQgcmVhY2hlZCBEUklWRVJfT0sgc3RhZ2Ugc2ltaWxhcg0KPiA+ID4gPj4+Pj4+Pj4gdG8g
YWxsIG90aGVyIHF1ZXVlcy4gVGhpcyBpcyBhIGxpbWl0aW5nIGZhY3Rvci4NCj4gPiA+ID4+Pj4+
Pj4+DQo+ID4gPiA+Pj4+Pj4+PiBNYW55IG9mIHRoZSBkZXZpY2UgZnVuY3Rpb25hbHRpZXMgbmVl
ZHMgdG8gYmUgZGlzY292ZXJlZA0KPiA+ID4gPj4+Pj4+Pj4gYW5kIGNvbmZpZ3VyZWQgZWFybHkg
ZW5vdWdoIGJlZm9yZSB0aGUgZHJpdmVyIHJlYWNoZXMgdGhlDQo+ID4gPiA+Pj4+Pj4+PiBEUklW
RVJfT0sNCj4gPiA+ID4+Pj4+IHN0YWdlLg0KPiA+ID4gPj4+Pj4+Pj4gU29tZSBleGFtcGxlcyBh
cmU6DQo+ID4gPiA+Pj4+Pj4+Pg0KPiA+ID4gPj4+Pj4+Pj4gYS4gZHJpdmVyIHdhbnRzIHRvIGR5
bmFtaWNhbGx5IGNyZWF0ZSB0aGUgdmlydHF1ZXVlcyBvZiB2aXJ0aW8tDQo+IG5ldA0KPiA+ID4g
Pj4+Pj4+Pj4gICAgZGV2aWNlIHdpdGggbW9yZSBwYXJhbWV0ZXJzLCBmb3IgZXhhbXBsZSBoZWFk
ZXIgZGF0YSBzcGxpdCwNCj4gPiA+ID4+Pj4+Pj4+ICAgIG11bHRpcGxlIHBoeXNpY2FsIGFkZHJl
c3Nlcy4NCj4gPiA+ID4+Pj4+Pj4+ICAgIEhlcmUsIHRoZSBkcml2ZXIgbmVlZHMgdG8gdGVsbCBQ
Q0kgZGV2aWNlIGVhcmx5IGVub3VnaCB0aGF0IGl0DQo+IG5vDQo+ID4gPiA+Pj4+Pj4+PiAgICBs
b25nZXIgdXNlcyBxdWV1ZV8qIHJlZ2lzdGVycyBmb3Igbm9uIGFkbWluIHF1ZXVlcy4NCj4gPiA+
ID4+Pj4+Pj4+DQo+ID4gPiA+Pj4+Pj4+PiBiLiBkcml2ZXIgd2FudHMgdG8gZGlzY292ZXIgdGhl
c2UgZmVhdHVyZXMgYW5kIHJlbGF0ZWQgYXR0cmlidXRlcw0KPiA+ID4gPj4+Pj4+Pj4gICAgZWFy
bHkgZW5vdWdoIHNvIGl0IGhhcyBjaGFuY2UgdG8gZGVjaWRlIHRvIHByb2NlZWQgdmlhIGFkbWlu
DQo+ID4gPiA+Pj4+Pj4+PiAgICBjbWQgaW50ZXJmYWNlIG9yIHByb2NlZWQgdG8gRFJJVkVSX09L
IGFuZCBmb2xsb3cgdGhlDQo+ID4gPiA+Pj4+Pj4+PiBjdXJyZW50DQo+ID4gPiBmbG93Lg0KPiA+
ID4gPj4+Pj4+Pj4NCj4gPiA+ID4+Pj4+Pj4+IFRvIG92ZXJjb21lIHRoZXNlIGxpbWl0YXRpb25z
LCBpbnRyb2R1Y2UgYSBmZWF0dXJlIGJpdCB0aGF0DQo+ID4gPiA+Pj4+Pj4+PiBlbmFibGVzIHRo
ZSBkcml2ZXIgdG8gc2VuZCBjYXBhYmlsaXRpZXMgcmVsYXRlZCBhZG1pbg0KPiA+ID4gPj4+Pj4+
Pj4gY29tbWFuZHMgYmVmb3JlIERSSVZFUl9PSyB2aWEgdGhlIGF2YWlsYWJsZSBpbnRlcmZhY2Ug
c3VjaA0KPiA+ID4gPj4+Pj4+Pj4gYXMgYWRtaW5pc3RyYXRpb24NCj4gPiA+ID4+Pj4+IHZpcnRx
dWV1ZS4NCj4gPiA+ID4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFBhcmF2IFBhbmRpdCA8cGFyYXZA
bnZpZGlhLmNvbT4NCj4gPiA+ID4+Pj4+Pj4gV2Ugd2VyZSB0aGVyZSBpbiAxLjAgYW5kIGl0J3Mg
bWVzc3kuIEFuZCBuZXh0IHRoaW5nIHlvdSBkbywNCj4gPiA+ID4+Pj4+Pj4geW91IHdpbGwNCj4g
PiA+ID4+Pj4gQWxzbyBpZiB5b3UgY2FuIGV4cGxhaW4gd2hhdCBleGFjdGx5IGlzIHRoZSBtZXNz
LCBpZiB0aGVyZSBpcyBvbmU/DQo+ID4gPiA+Pj4gQXMgZmFyIGFzIEkgY2FuIHNlZSwgdGhlIHNw
ZWMgc2F5czoNCj4gPiA+ID4+PiBTZXQgdGhlIERSSVZFUl9PSyBzdGF0dXMgYml0LiBBdCB0aGlz
IHBvaW50IHRoZSBkZXZpY2UgaXMg4oCcbGl2ZeKAnS4NCj4gPiA+ID4+Pg0KPiA+ID4gPj4gVGhp
cyBwYXRjaCB1cGdyYWRlcyB0aGlzIGRldGFpbC4gUGxlYXNlIHJlYWQgdGhyb3VnaC4NCj4gPiA+
ID4+DQo+ID4gPiA+Pj4gQW5kIG5vIHZxcyBhcmUgYWN0aXZlIGJlZm9yZSBEUklWRVJfT0suIEhv
dyBjYW4gdGhlIGRldmljZQ0KPiA+ID4gPj4+IGFzc3VtZSB0aGF0IHRoZSBkcml2ZXIgaXMgcmVh
ZHkgYmVmb3JlIERSSVZFUl9PSz8NCj4gPiA+ID4+IERldmljZSBkb2VzIG5vdCBhc3N1bWUuDQo+
ID4gPiA+PiBXaGVuIHRoZSBmZWF0dXJlIGRlc2NyaWJlZCBpbiB0aGlzIHBhdGNoIGlzIG5lZ290
aWF0ZWQsIGRldmljZQ0KPiA+ID4gPj4ga25vd3MgdGhhdA0KPiA+ID4gQVEgd2lsbCBiZSBsaXZl
IGJlZm9yZSBEUklWRVJfT0suDQo+ID4gPiA+Pg0KPiA+ID4gPj4+IFdoeSBhZG1pbiB2cSBpcyBz
cGVjaWFsPw0KPiA+ID4gPj4gQmVjYXVzZSBpdCBpcyB1c2VkIHRvIGRvIGZ1bmRhbWVudGFsIGRl
dmljZSBhbmQgZHJpdmVyDQo+ID4gPiA+PiBjYXBhYmlsaXRpZXMNCj4gPiA+IGRpc2NvdmVyeS4N
Cj4gPiA+ID4gVGhlbiB5b3UgbmVlZCBhbm90aGVyIHRyYW5zcG9ydCBvciBhIGNvbnRyb2wgZGV2
aWNlLg0KPiA+ID4gU28gTWF5YmUgaXQgaXMgYSBnb29kIGNoYW5jZSBmb3IgbWUgdG8gY29udGlu
dWUgdGhlICJ0cmFuc3BvcnQgdnEiIHdvcms/DQo+ID4gTm9wLg0KPiA+IEFRIGhhcyBkZWxpdmVy
ZWQgd2hhdCBhbGwgd2FzIHJlcXVpcmVkIHVuaWZvcm1seSBmb3Igc3cgYmFzZWQgZGV2aWNlLCBQ
Q0kNCj4gUEYsIFBDSSBWRnMuDQo+ID4gTGV0cyBmaXJzdCB1bmRlcnN0YW5kIHRoZSBtb3RpdmF0
aW9uIG9mIHRoZSBjb21wbGljYXRpb24gZnJvbSBKYXNvbi4NCj4gDQo+IEl0J3Mgbm90IGEgY29t
cGxpY2F0aW9uIGJ1dCBhIHNpbXBsaWZpY2F0aW9uIGJlY2F1c2UgImZ1bmRhbWVudGFsIGRldmlj
ZSBhbmQNCj4gZHJpdmVyIGNhcGFiaWxpdGllcyBkaXNjb3ZlcnkiIGhhcyBhbHJlYWR5IGJlZW4g
dGhlIGNoYXJnZSBvZiB0aGUgdHJhbnNwb3J0Lg0KVGhpcyBkb2VzIG5vdCBleHBsYWluIHRoZSBt
b3RpdmF0aW9uIGF0IGFsbC4NCkFkbWluIGNvbW1hbmQgaW50ZXJmYWNlIGlzIHBhcnQgb2YgaXQg
YWxyZWFkeSB0byBkaXNjb3ZlciB0aGUgY2FwYWJpbGl0aWVzIGJvdGggZGlyZWN0aW9uLg0K
