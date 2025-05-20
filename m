Received: from mx0a-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1889262FE1
	for <virtio-comment@lists.linux.dev>; Tue, 20 May 2025 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732127; cv=fail; b=WYcMvmTyJeBWmG19J1QAbizQZSXMrWDyh8LEjwSrWQGdfZE+ZjYnU47+zvqeWro46QtTMjGaorOeK2Y2ifzlW4JBfrfAtlE5s7Br7fevWRgF+x+8XYMBi8uuK+k5EBjH2YpHp5jcKffU/S7EdtOlZxzj/2dVj4ER2x1mm7XawHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732127; c=relaxed/simple;
	bh=7RyeQPmY74uLs4j6ghcjqk1X9Kd9KHFnTmy25KI2fcU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=Jy3h+1QKu0puhMI1CpgtNVaEILLYiCcLMm9yJaUseM2AaPyO+8m79Bv8TIoAmTQKXoPQU0wljG7DdlisBp8OQFgiVdJ288EqdqJScAECzSitsE12ot/mn1iel+Hr7+VqeWQsaI2Ajcse3uPJ+0YJrjiEu+06hmT09gIpJgIBFcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=fail (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=JD2Azd2U reason="signature verification failed"; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="JD2Azd2U"
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JNSxFA011011;
	Tue, 20 May 2025 02:08:44 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 46rebt0vfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 02:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKGVD01APJppL+WgxIptTWCnaciByCrNf1OOsmsIOJZpGEOwL66c33+qtoWHPUpkFgsY9rJXZLah90EXhFkZitJ5sG5kIvcjh8zEuHXdbzVmCbzyPD9qyo4hZVQvrI9NjRcz7S9weRglttJT1juI4+f/tEG+6FrM1hICuGbZse5pnYeICLzW9LB4AyubzqmUl42qvTx3aV5hSp21jFia9dRWm/VIrzRqUnOg8upPAL40u12ic+C5Wonu5N7D7RGzdJTpDDSvuAiAv9readZvR01+YV+hVx/nLGwG35v3NRusBZnRHVRRz9WY7WE01NkmBaIhdKZC4NbQCuJ/m3H8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iy/dD3NJ0ElUelQ8T5NcEVP43qBDBQikuif6fTAGlc=;
 b=KZ7mBRn4GD9fQY9JMwV2dyYCVml6fU58Vx2rNnIrfn23dxo5yAuNS8IGC3Beta3eHFjcCI/+QRl6sTH/KwTdWt8999T+7v+wCOLVdUY0I77qqZHdTKzBeuyoe9B4BeIdix7O2+FpfEWRqYwXKVrxDGsKwrJbYWhBXrm0ub8kEAGLU3553tJKx9PwYLWhiNs1q29zKs2topcDVpTAxW2OM4k3MuvoDXrs0f+xEqVmzeyS31C7FSARe7g9bu6EWOgO5tZ3p54SwzFUUsWO8xOUp6DHHXQiWfMcc9RNaTtUYSfCbvg55gz2FqCa4B9weRUMSXXEblre0247L1jn63M67A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iy/dD3NJ0ElUelQ8T5NcEVP43qBDBQikuif6fTAGlc=;
 b=JD2Azd2UfUkXLz+MuPXbdoZ6iEx6bkdvX52czPgusEsLhVDwFae4CfzXJmbQuXDeSQTqbXHelvw+i8qQ8NAz7wi8Lyb2+jpMWpDTC/LBHZqXNkYn3NmyglZU4neFFKT56ki1pjy3sJFoj3BAOE4ayv8yW6qUXQ5qm6yDgdEMaRc=
Received: from DS0PR18MB5368.namprd18.prod.outlook.com (2603:10b6:8:12f::17)
 by CH0PR18MB4193.namprd18.prod.outlook.com (2603:10b6:610:bc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Tue, 20 May
 2025 09:08:39 +0000
Received: from DS0PR18MB5368.namprd18.prod.outlook.com
 ([fe80::ad53:bef2:cc17:13ac]) by DS0PR18MB5368.namprd18.prod.outlook.com
 ([fe80::ad53:bef2:cc17:13ac%3]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 09:08:39 +0000
From: Srujana Challa <schalla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>,
        "pabeni@redhat.com"
	<pabeni@redhat.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        Satananda
 Burla <sburla@marvell.com>,
        Nithin Kumar Dabilpuram
	<ndabilpuram@marvell.com>,
        Jerin Jacob <jerinj@marvell.com>,
        Shiva Shankar
 Kommula <kshankar@marvell.com>
Subject: RE: [PATCH v6 3/4] virtio-net: extend virtio_net_hdr for IPsec
 support
Thread-Topic: [PATCH v6 3/4] virtio-net: extend virtio_net_hdr for IPsec
 support
Thread-Index: AQHbuQPsYGbV+4i3sku6x9CK3bTE9rPaIjwAgAE3zCA=
Date: Tue, 20 May 2025 09:08:38 +0000
Message-ID:
 <DS0PR18MB5368739EE4689DFFFEE3B1B5A09FA@DS0PR18MB5368.namprd18.prod.outlook.com>
References: <20250429124010.1949371-1-schalla@marvell.com>
 <20250429124010.1949371-4-schalla@marvell.com>
 <CY8PR12MB7195FF5D309EDF54DB53C98FDC9CA@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB7195FF5D309EDF54DB53C98FDC9CA@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR18MB5368:EE_|CH0PR18MB4193:EE_
x-ms-office365-filtering-correlation-id: 4d7a24fd-f7a3-4eac-7459-08dd977de8e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QWsvWUtHaW1EMU5JMXBlSzZzNndJSTZydHJWeHdSY0syWmg3RzVqVGZJTXkx?=
 =?utf-8?B?UTM4OTg4VStjb2ZtZGJKL3RCN3NEb3M4MURiblVLd3JPZWdoUDhCUVNGSXhN?=
 =?utf-8?B?VzBLd3VGRFdhVkZONFpFcFZlM0N0NlkwZlN6NFp1Um9CWVo1R1Vrd1lXa2pm?=
 =?utf-8?B?NmdMYUlpTFJjajlqLzl1RDJDQkNEZVgyZ3BnTzBmOWZKWktpZGpicURuUXlT?=
 =?utf-8?B?RUtTMU9EUHp1TEVMbkpqSWhkQ3h0K3ErNmFVUWw3NElFbHBpNzdIanY5enZY?=
 =?utf-8?B?RjFMbXVYOUFEbjBzVm9zQ2lRd3ZQaGM1TisrQ2MrU2Vkd2x3TEd3T1p0cmda?=
 =?utf-8?B?MWdVQmRaNEludjdrcEhwOHRQTXp3WVZBTkJhQWtoMzRMZzhrYjlqMUM5RjY0?=
 =?utf-8?B?aXBLSG9yTS9EdEJ4RitnOXpSVnRtN204VGozYkRIZ2hqT2k2bmpuZzFHNUV0?=
 =?utf-8?B?UlBzY1poWUFub2JGeWxZcythbFpYSzdTd2FRWm1rU2V1M0dHS0tPOFdNSEJR?=
 =?utf-8?B?N1NwQzcyZ3Q1QmhIUDBtVGplM0I5MGNxclprRXRhNWF0TkYyMXM5dk8vY2xB?=
 =?utf-8?B?dEN2VjE1MWUzREF5TjBKZ2Nrb2xZMDBLUWo4dXU4d29EMlZkK3dFU1lXa09v?=
 =?utf-8?B?Q0Y2bWJpV2lEOFBDQ3NNeDNwQllPREc5R3V5eEVhVVBQbFJERDdCYUMrMEJp?=
 =?utf-8?B?VEUvbW5JQ3ZjVlVkTnZ6VjcrVVRkUWJpbWlrbzZpY3FNTGtSNjhtN1EwUHRs?=
 =?utf-8?B?dVpGdmo0K3BianIwTU1zSnc3WGFOQTc1TmpLdmZrU0RKTVF3ZXBNRitlSkJ2?=
 =?utf-8?B?SFl1WE1vbllUUWxXRytLMXFxY1QyNHM1SjNCRXNRSCtWa3lJSUdramJoWlR3?=
 =?utf-8?B?RGxaL2JOcEtZVHlmaGRUbTZIbkk0ZHMyM25kdnhveWlWOW1qYjNva2V1b29u?=
 =?utf-8?B?dVU0ZVk1d3IyRFNZN2o0TDdOb2ZadEV0L0gwSVhrY3JWV3QyVkpwK21udFhV?=
 =?utf-8?B?L0pOWUtPUk04QUo0cHozRFVmYXpWYzFFd2x3MVRZNTZhS3FIbkRhVXduV0c3?=
 =?utf-8?B?akRqMm1sQ2RZb0Z4REZqQXIrU0dMYm5vZi9YUTU2VGcvV2Z0K1NyWER4UCtn?=
 =?utf-8?B?R1hnN3RRWkJkSnJxZVNKOTZqc0VIMXpMMWVPSXJxVUZ5K0pDT0hKMHQrSWVp?=
 =?utf-8?B?dmU5dWJ4WWtvRmcxVWlJNHgzWUIzVlpNWG1HYlFwZWVUUVZiRnd2SWZJVnNF?=
 =?utf-8?B?TGc4WTRQRGNZQ25SdWpPbjJsOW45SDZMbjFhekJQRm1reFpOV2dnazJCbFFx?=
 =?utf-8?B?VzVpZ1lZcTdEaWgrcHcxTXJWREM3ZTR5cXFnMDEwUG9wYyt5UHJZS2ZmUEhl?=
 =?utf-8?B?VHIvaGdsRmFDOUcwWmRXRTlCTFlDWXhXQ2JBMitzMytNREFLS1Z4OXhQV1RK?=
 =?utf-8?B?Nm82bVhGbjhBVWhWRHFTekZKWEFCTlVlSlU0ZmpDMmM1aXJKdE45aVl5UmJo?=
 =?utf-8?B?Zk5rNFQxZkNLMmk5clYzejNTcU9HdkZ2WU9zMngrUXljMFVjcEFFWVBjd0xB?=
 =?utf-8?B?a3NEWDMvQTRDbkFhTy91eUczdGtnVkRvY3lwcXNySDdER2JBbkdXaDJHTnBk?=
 =?utf-8?B?VkRna2E5YURZS0FkMktLT0tTdURZbzFNU3Y4MlVIOVNHdUZFZ1BkdWQwM0Zu?=
 =?utf-8?B?SDJJM1FGY1crRlJ1dzJZWDdSVjVBL1lVNVB0bloxTlF1MGNUS3JCZ3ZDZnBB?=
 =?utf-8?B?eVgvOWJEWE9Zd3FFMVJYNlZZMHhTTDd4VXc4eVNjTXJFTDBPSkl5YW9xeUZY?=
 =?utf-8?B?cXJISUFWWlNRdlhOcUY4R1RjTkFYZWIvclArdEFQMzBGQ0g0Y3RUWHg5RGc4?=
 =?utf-8?B?WGxOZmEwU0FuVldyY2FpaFdJdnBjckUyKzUvcFB1QWZPN0FzRzQ5Qzk3T0N0?=
 =?utf-8?Q?XQ10ATShNxw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR18MB5368.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TFl2cjRWTk5sRWx6S1drRDV2V24yeUVzMDVRMjNDNXJ4d3VCN2pYelhLVzdV?=
 =?utf-8?B?alVpN3BOVElQK1N2b2VJcGtjdzFjTlRLZ2w5L05pekxTbEROb2I4ZGZoT0o0?=
 =?utf-8?B?Qkk2V3p1TVVFNGFXd1JabEdkb2k3dzByRllmK0d5UmtHV0dzeDg4U2pZTEVl?=
 =?utf-8?B?OFpDQk5zV090L2daWlAwdExJMVFoa3cyZjZuUDdDdkVBQ25mWnAyMHR5WjVo?=
 =?utf-8?B?MWN4NUZKSFNqNTFabGlzMW4vN0k1QzdhRjJiaG82c0s3VzFoUUVqZitIbmlj?=
 =?utf-8?B?d1NoSzNNWC83RU5wSkc4dFFCTVB3clBNSDJ4b2xDT2dCblNZaUVsRDJyUlVk?=
 =?utf-8?B?Q0IxQUV6S3p2UEtrZjU5TjZkWCs5dDNzUHFGYWs0aXdhNTdtdy9EenFXVXNV?=
 =?utf-8?B?b2VYNUduVnloRzh4VDdTRzVjblQ0NUVGbmplNDU4ZndYZU9LOU9hRUN5ckU1?=
 =?utf-8?B?UzVhZ2FlMnpObmlCQTVUVVJKeWcyQzZ0RndUYlYvUkMzcUxCRm9zQzNKU2dC?=
 =?utf-8?B?STlGRy80OGkyNEN3QlRTWU94RUdESkZWczJ2ZGdlQ1RhMlh5U2UzUjk2RThO?=
 =?utf-8?B?Y2dQT1I2Y0swWEhxTE80Vm83U2NEY21BSys3a2pPYm1FRk9zMldONGE0VEpk?=
 =?utf-8?B?ODQ3bW9CK2FiYWZ2V3crNk1QUXozdGxkeUdOYnRFMW9QYytEMzFYeFBKTnRN?=
 =?utf-8?B?TTU2dlZRTEhLa2lEa3ZFZEdWMkdiK1RDTVhlRjBwQWFkbmROYTZCUzdUbkkz?=
 =?utf-8?B?RytnaUZSOE1IM1ExZzJYcytmZFN0T1FCS3UvTUlGMndsdUN3ZDdWbEoxWVdH?=
 =?utf-8?B?aDhzSHZRbERadGZhU1kycE5GbktkbmcrbkNWcEFmZTA0NCsrL0JLMGNsV0d5?=
 =?utf-8?B?UC9kT1hReENJU3hFSmZFdGxJTkQzcE5wallBbmJvTjZLKzRsODV1MU5xdzJC?=
 =?utf-8?B?TjVkdGR1K0psY0lzdWx0ZFVaNjJMRDRIbVkxcXAwRmU0bitPNWR0a0Y5MTYz?=
 =?utf-8?B?ZWllbnF1MDd2ZnFPK3k3ejFaUzM3TjRiVnVVaklIYzZjekJlOXlnZnJTSFg4?=
 =?utf-8?B?eVY4K1pXcTAvOVVOTXhiNEJzeVRMVWlBYWZ1WW9LNHpyV0ZJRUowYzY1UGpa?=
 =?utf-8?B?VHdCamoweVNEVVlSUFo5OVNRcWdxT05ReHU3cnFFM3V4aGcvSTFZTmtxaUor?=
 =?utf-8?B?OTJRY2xOODlJUXFIT1h3MFRWUTYrWVhQUVg1SFU2S2FsWWovTEFYTFdXQXBh?=
 =?utf-8?B?ditLV2EvdFRTbzg2V3Q5NDhRdThYd0VLQlhNRC9zWWhDWFgzTStKUjB0QUll?=
 =?utf-8?B?Z3lDSllVTW5xUkl2VHBkUUZFdkt1SGNZWnJQKzlnaU84Tk9zS0dlMDlsQVdH?=
 =?utf-8?B?T3BvVm9hck1hYXJuRzc1OXlsOEozL0V0QTlwdm1KSEtNY3JQMnNaeGJOaFQ5?=
 =?utf-8?B?UjFyM055dDFUVFhySWh1ZFRheXZiMUZaRWkrYUlJb3p4ZUNHb1ZGR2tFdXg2?=
 =?utf-8?B?eEI0ZndLRGpLd0RzYzdDaUYzM1lLZDZweGZSSm5BODNwMzFoZXkxK2tIRVda?=
 =?utf-8?B?TXlaS3FWWEZ3OUhxYVUxNllid2RGbGZndzBRRG95bWZHVVJKYmY5V3RLL3BS?=
 =?utf-8?B?THcybWFGeXc1L0VJMXkrdlRPY1lrSzBsa0xqa3h3SjJUb2NsMmVFRm1vSDh5?=
 =?utf-8?B?SXcwbjU4VENjb2JsTWdDSDVlOWFGbytmVm82K3NjUDFVVXhWMmw1Nk54ZkZR?=
 =?utf-8?B?b2RBSTJ3ekpDdGVkb2drWkw3UVBIU1JJVFliUlBPVW8zdCtxRGh3K0J1OEZS?=
 =?utf-8?B?N21WSWdXQnRWOUdNOHdIS204TnAxRlVlOGJ0N293UkFrTnZONFpqK1J1KzFn?=
 =?utf-8?B?c2t4RDIrQ3hJajhLQlZranFQc016ZEJDWUlRc3lXaEhsRGVPby9iakwvWDZh?=
 =?utf-8?B?QnRzVDJMLzE5Z2diSmFlcUtISEhKSUNaQVVMdi9pQi9zMnJzZFVYaEpZRCtN?=
 =?utf-8?B?eUpnTng2cEJ3cVY4S1Qwd1h0bWZzTlY2ZHR5aS81QUVpajlpY2JnbkNXODNp?=
 =?utf-8?B?L2s1RzkyNHIveGs0OVFTWWhWYUxlckxqQVBGZ0tYeG5QRjRhamhTL2lvSTZm?=
 =?utf-8?Q?4Qqi8Ymm6Rl5Wah0iIXYCWWxV?=
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR18MB5368.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7a24fd-f7a3-4eac-7459-08dd977de8e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 09:08:38.9991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: txeu2+WydzxKj/n5WhBn4eRkrYRTzrhCh1x44fh3Hfnbq1Do0LD012eErrtY4mwNW2BDGeIh2z23pZNQs32oRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR18MB4193
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA3NCBTYWx0ZWRfX8LgHKByIQDps QD31Mgds+mQ4BMJeEwr5qS/+ROfV6iRMCLe448rROXr12OhnQ20WDgIS1ENYWl+x1rNlt+yxspR yS/wOe9Vtfbp/NMWGx9qTy5+ScMn2ytS6wLATBolBpp4BmDTC3rtAVy0819I9fQSjNqtRG1hP4H
 05mBsRxydV0NZ93aid3uYHm1EBVd1yf7SGcrFatXgFHRuTyJqKtmIZzRRCIQ3x9fXpvJlN8LG5a 3gK1AnDdAKwC1URTOBRQBVYnltNiKraY7NTwYqQvRvigIoMWpDOrwKxCwScqV3WSGwUCiaRSsYg UqOYGu/y1PSJSBtj4RdVyGjLoLjTgczB6rI0wBv9G+9F6GDDJaXHDRdSlfxGff/wfq+keSPwCJS
 KeVYFqr3xDm6KSL4RmzmR/nBcU2zG9xctOzGQyZkTMJhvrb052ITZdZOtefb0R38FIJpvVeH
X-Proofpoint-ORIG-GUID: HL_gGEImKg-TUXD0hbtTWzsI_bfPN7gq
X-Authority-Analysis: v=2.4 cv=BqCdwZX5 c=1 sm=1 tr=0 ts=682c469c cx=c_pps a=WCFCujto17ieNoiWBJjljg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=-AAbraWEqlQA:10 a=RpNjiQI2AAAA:8 a=M5GUcnROAAAA:8 a=Ikd4Dj_1AAAA:8 a=OkTfKH2jSJ2AhYtYnTYA:9 a=QEXdDO2ut3YA:10 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: HL_gGEImKg-TUXD0hbtTWzsI_bfPN7gq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01

> Subject: [EXTERNAL] RE: [PATCH v6 3/4] virtio-net: extend virtio_net_hdr =
for
> IPsec support
>=20
> > From: Srujana Challa <schalla@=E2=80=8Amarvell.=E2=80=8Acom> > Sent: Tu=
esday, April
> > 29, 2025 6:=E2=80=8A10 PM > > Add IPsec resource object identifiers to =
the
> > virtio_net_hdr for identifying > encryption/decryption operations on
> > tx and rx side respectively,
>=20
> > From: Srujana Challa <schalla@marvell.com>
> > Sent: Tuesday, April 29, 2025 6:10 PM
> >
> > Add IPsec resource object identifiers to the virtio_net_hdr for
> > identifying encryption/decryption operations on tx and rx side
> > respectively, along with flags.
> >
> > Signed-off-by: Srujana Challa <schalla@marvell.com>
> > ---
> >  device-types/net/description.tex | 51
> > ++++++++++++++++++++++++++++++--
> >  1 file changed, 48 insertions(+), 3 deletions(-)
> >
> > diff --git a/device-types/net/description.tex b/device-
> > types/net/description.tex index 105a002..2540f2b 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -597,6 +597,9 @@ \subsection{Device Operation}\label{sec:Device
> > Types / Network Device / Device O
> >  #define VIRTIO_NET_HDR_F_DATA_VALID    2
> >  #define VIRTIO_NET_HDR_F_RSC_INFO      4
> >  #define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
> > +#define VIRTIO_NET_HDR_F_SECURITY      16
> > +#define VIRTIO_NET_HDR_F_SECURITY_ERR  32 #define
> > +VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN 64
> >          u8 flags;
> >  #define VIRTIO_NET_HDR_GSO_NONE        0
> >  #define VIRTIO_NET_HDR_GSO_TCPV4       1
> > @@ -618,7 +621,11 @@ \subsection{Device Operation}\label{sec:Device
> > Types / Network Device / Device O
> >          le16 outer_th_offset    (Only if
> VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO
> > or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> >          le16 inner_nh_offset;   (Only if
> VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO
> > or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> >          le16 outer_nh_offset;   /* Only if VIRTIO_NET_F_OUT_NET_HEADER
> > negotiated */
> > -        u8 padding_reserved_2[6]; /* Only if
> VIRTIO_NET_F_OUT_NET_HEADER
> > negotiated */
> > +        /* Only if VIRTIO_NET_F_IPSEC negotiated */
>=20
> > +        /* Only if VIRTIO_NET_F_OUT_NET_HEADER or VIRTIO_NET_F_IPSEC
> > + negotiated */
> This should be,
> union {
> 	u8 padding_reserved_2[6];
> 	struct ipsec_resource_hdr {
>                  le32 resource_id;
>                  le16 resource_type;
>               } ipsec_resource_hdr;
>   };
>=20
> >  \end{lstlisting}
> >
> > @@ -972,6 +979,15 @@ \subsubsection{Packet
> > Transmission}\label{sec:Device Types / Network Device / De  together
> > with the
> > VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV4 bit or the
> >  VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}.
> >
> > +If the device supports \hyperref[par:Device Types / Network Device /
> > +Device Operation / IPsec Operation]{IPsec Operation}, the driver may
> > +set
> > VIRTIO_NET_HDR_F_SECURITY bit in \field{flags}, if so:
> > +\begin{enumerate}
> > +\item the driver MUST create IPsec Outbound resource object
> > +\hyperref[par:Device Types / Crypto Device / Device Operation / IPsec
> > +Service Operation / Resource objects /
> > +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-ENC-
> > SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_
> > +OUTB_SA} \item the driver MUST set \field{resource_id} to a valid
> > +IPsec outbound
> > +      resource object ID.
> > +\end{enumerate}
> > +
> >  \devicenormative{\paragraph}{Packet Transmission}{Device Types /
> > Network Device / Device Operation / Packet Transmission}  The device
> > MUST ignore \field{flag} bits that it does not recognize.
> >
> > @@ -1032,6 +1048,10 @@ \subsubsection{Packet
> > Transmission}\label{sec:Device Types / Network Device / De
> >
> >  If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT  rely
> > on the packet checksum being correct.
> > +
> > +If VIRTIO_NET_HDR_F_SECURITY bit in \field{flags} is not set, the
> > +device MUST NOT use the \field{resource_id} and \field{resource_type}.
> > +
> >  \paragraph{Packet Transmission Interrupt}\label{sec:Device Types /
> > Network Device / Device Operation / Packet Transmission / Packet
> > Transmission Interrupt}
> >
> >  Often a driver will suppress transmission virtqueue interrupts @@
> > -1084,8
> > +1104,8 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device
> > Types / Network Devi  \end{note}
> >
> >  When calculating the size of \field{struct virtio_net_hdr}, the
> > driver -MUST consider all the fields inclusive up to
> > \field{padding_reserved_2}, -i.e. 32 bytes if
> > VIRTIO_NET_F_OUT_NET_HEADER is negotiated or up to
> > \field{inner_nh_offset}
> > +MUST consider all the fields inclusive up to \field{struct
> > +ipsec_resource_hdr}, i.e. 32 bytes if VIRTIO_NET_F_OUT_NET_HEADER or
> > +VIRTIO_NET_F_IPSEC is negotiated or up to \field{inner_nh_offset}
> >  i.e. 24 bytes if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated or up
> > to \field{padding_reserved}  i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT
> > is negotiated, and 12 bytes if not.
> >
> Please change the wording to refer to padding or ipsec_resource_hdr
> accordingly.
Could you confirm if changing as below would be fine,
i.e. 32 bytes if VIRTIO_NET_F_OUT_NET_HEADER or VIRTIO_NET_F_IPSEC is negot=
iated or up to \field{inner_nh_offset}.
If only VIRTIO_NET_F_OUT_NET_HEADER is negotiated and VIRTIO_NET_F_IPSEC is=
 not negotiated, the driver SHOULD
reference \field{padding_reserved_2}. Otherwise, it SHOULD reference \field=
{struct ipsec_resource_hdr} from
the \field{union}.
i.e. 24 bytes if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated or up to \f=
ield{padding_reserved}.

Thanks.
>=20
> > @@ -1341,6 +1361,21 @@ \subsubsection{Processing of Incoming
> > Packets}\label{sec:Device Types / Network  \field{flags}, the device
> > MUST either provide a zero outer UDP header  checksum or a fully
> > checksummed outer UDP header.
> >
> > +The device MUST set the VIRTIO_NET_HDR_F_SECURITY bit in the
> > +\field{flags} if the packet goes through the IPsec processing.
> > +Otherwise, this bit MUST be cleared. The device MUST set or clear
> > +this bit regardless of setting VIRTIO_NET_HDR_F_SECURITY_ERR or
> > VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN bit.
> > +
> > +The device MUST set the VIRTIO_NET_HDR_F_SECURITY_ERR bit in the
> > +\field{flags} if any error is encountered during IPsec processing.
> > +Otherwise,
> > this bit MUST be cleared.
> > +The device MUST set or clear this bit regardless of setting
> > +VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN bit.
> > +
> > +The device MUST set the
> > VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN
> > +bit in the \field{flags} if the SA associated with
> > +\field{resource_id} reaches the SA lifetime soft limits configured in
> > +the \field{struct
> > virtio_crypto_ipsec_lifetime}.
> > +See \hyperref[par:Device Types / Crypto Device / Device Operation /
> > +IPsec
> > Service Operation / Resource objects /
> > VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC- OUTBOUND-
> SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA}.
> > +
> >  \drivernormative{\paragraph}{Processing of Incoming  Packets}{Device
> > Types / Network Device / Device Operation /  Processing of Incoming
> > Packets} @@ -
> > 1392,6 +1427,12 @@ \subsubsection{Processing of Incoming
> > Packets}\label{sec:Device Types / Network
> >  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 in \field{gso_type} are not set,
> > the driver MOST NOT accept the packet.
> >
> > +When VIRTIO_NET_HDR_F_SECURITY and
> > VIRTIO_NET_HDR_F_SECURITY_ERR bits
> > +are set in the \field{flags}, it indicates that the device
> > +experienced a
> > processing error on the IPsec packet.
> > +It need not be an 'error packet'. For example, a particular SA was
> > +not offloaded or SA has reached the SA lifetime hard limits
> > +configured in the
> > \field{struct virtio_crypto_ipsec_lifetime}.
> > +So vnet_hdr will have both bits set.
> > +
> >  \paragraph{Hash calculation for incoming packets}  \label{sec:Device
> > Types / Network Device / Device Operation / Processing of Incoming
> > Packets / Hash calculation for incoming packets}
> >
> > @@ -3528,6 +3569,10 @@ \subsubsection{IPsec
> > Operation}\label{sec:Device Types / Network Device / Device  See
> > \ref{sec:Device Types / Network Device / Device Operation / Flow
> > filter}  for details about flow filter.
> >
> > +Note that there is a small race condition where a SA object might be
> > +destroyed while a recieve packet is still inflight. The driver SHOULD
> > +handle this situation appropriately.
> > +
> >  \paragraph{Device and driver capabilities}  \label{par:Device Types /
> > Network Device / Device Operation / IPsec Operation / Device and
> > driver capabilities}
> >
> > --
> > 2.25.1
>=20
> For the rest of the content of this patch:
> Reviewed-by: Parav Pandit <parav@nvidia.com>

