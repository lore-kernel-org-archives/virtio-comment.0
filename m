Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D42018D
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587726; cv=fail; b=RLmgBoEPhXiUv+Vsja44Pz8ueXzH+rSqr9kG0JMmzxZESC/GFNZZgvBndOarcTRiopCLPQaecMtLnAi4i/lCThfZsd18vDYiXTPXJi4MmjpkllidpgsbjGD+Ptp2vScoSUQCBlSFOMQHAR0dt/k4PbdF9NBFbIXE+BxPEBG93oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587726; c=relaxed/simple;
	bh=vXXCr6/hG8CpPhy6NxhrrKjXSptrbUau718VICG8tWs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EponyznfoiDSdcINnUlkNuYAdH3l+sYtwUX13bWXfzM27GSxMY2Llpw9qUd2Tc+EvOAwzqledAHr2+SbnsRB8zT85UVxEdJARg3MGXAM/EoUMAIoBJ2lp+FDQwrq/JPsgj/6zpqCbNgVIxQ1RRiOoGZw22qtRz64QkN7PTHRv2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Jopt0Um+; arc=fail smtp.client-ip=40.107.220.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jopt0Um+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUh91Nejl2r0Uv09gFMpvQJMI1V6eWFA+6Z9SreR2NPQEZP8qBGUkIJNt0c9PJ+TMCcs6UoicExHatwLa7lZM/srI/ivLbOSzcIvWiC3yvupftgAqF+5i/Gqo58jP6UwkYmsoAOhWASRNg2dbfM9i/01Cir8M1kfnrWA1+fg5zXSFWVcVt97Vc/leC1fxUoSDrdJAG1OXxhGPAY2OWauMKUqcEnc3g/VeHkHEn46aG4Ph9sNvqpsLssOHrzjYVCALAztRDwMOl71T/44Ef3eHC64eT2j4Tsvu6OllNtFk85ZEmn+mmuBU9ogRhq8iegIz4qhzpw8JUIgJKXiKbp3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXXCr6/hG8CpPhy6NxhrrKjXSptrbUau718VICG8tWs=;
 b=lGWDAEhApS10DeocTkfdDeO2Z7cFKBUlF62UT6kdXheWtCVxj/Adryv1OlplNTHhIVFt7ISlcFU8JRWmXbdYbC3NlNSMn3yF70N+OYB3GdUepsNLoGKavtRG131Us0LTa6J+3fzh11nez24yL9Po7hpWRlU0TuopB/+dV1hTeNMdhmSXYgWZgg8rsR7VmFcvCmb4P99MjfvKSBdHAQLV5vmYa/3WfnII1jgkESP6xQnI6ccpwL8v9r1XICeWsPgBz050OWCHsHGilDkptRJWOtK5q3iPDq4rB/kePqo003BnsHOyCTy001S8D9OC6Q9LidWRVoStURqoY+LvukTRIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXXCr6/hG8CpPhy6NxhrrKjXSptrbUau718VICG8tWs=;
 b=Jopt0Um+DZTX7ZiEpFOVB8FQsEpY50HeYL9uZ+/hq1eWSUFzzPPCiwQHkd+LUZ1Fu1mkgKZig0A1s18dw+sFCmcCRuSUbssvh1m2bQPLACh1uTEmi+j5B6b9o2y4SKjrPEXhRP4DR2GJA0FlEwGLjzq2yFl5qhJpqeNz3+9hHmXAV12wmJ6IabUm9ZAa3ygKQWSvLsCeBAbyl9VRB5FHa/8/U3jMGP7Vgapr3Nk0KIl7cr4/bm8HNSYmjR1UWjqokS2pM5TQTiX8+WZpOfUT2MJWQwJKPnuSRq5hjtaS/ZiC7k1pSNhvsvGxGGY4GWv1nl8lCSmbukQmMcvT+hGeJg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH3PR12MB8401.namprd12.prod.outlook.com (2603:10b6:610:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Wed, 2 Apr
 2025 09:55:21 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 09:55:21 +0000
From: Parav Pandit <parav@nvidia.com>
To: Sergio Lopez Pascual <slp@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>
Subject: RE: [PATCH v3 0/3] shared-mem: introduce page alignment restrictions
Thread-Topic: [PATCH v3 0/3] shared-mem: introduce page alignment restrictions
Thread-Index: AQHbovlVGtD020GCykyvnWr6inKTN7OP/jyAgAAcMgCAAAiIoA==
Date: Wed, 2 Apr 2025 09:55:20 +0000
Message-ID:
 <CY8PR12MB7195FB85CD0B553F8C262456DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250331213711.63398-1-slp@redhat.com>
 <20250402033354-mutt-send-email-mst@kernel.org>
 <CAAiTLFUxqPp4V=gkJ9CWttoP1wSKEtp5WrE9yhePFN2PiMVa5w@mail.gmail.com>
In-Reply-To:
 <CAAiTLFUxqPp4V=gkJ9CWttoP1wSKEtp5WrE9yhePFN2PiMVa5w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CH3PR12MB8401:EE_
x-ms-office365-filtering-correlation-id: 5bb0155c-60e0-4719-c58d-08dd71cc7b2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d3pNLzh1M0dsMGdNS2tESHl4RVlIRzM5dmNPSDRNSjRwdzZwOCsyb1dIaDQz?=
 =?utf-8?B?cExOSm8vOTIzYWVKcVNaandUMTdEUk9HZkk2SnRhZHhIQTkyQWc0UnRVUHgx?=
 =?utf-8?B?aURoSkcwdUsrU1BqbFo2S2Z3ZUh1U2JwRDlOWG9jV3MxYnZHMUpiTktxS3RJ?=
 =?utf-8?B?b1NYSzNDUzRnNEZhK2w0WVBZaHRXWWJSc05zTk1EdnZxQ3NFZzlFZ2EzYlJ1?=
 =?utf-8?B?R2k5TGh2Qy9lSzQ2ZjZrcHBVc0lOMnZERGJCWUREeUdpdjA2YWx2cWJpMUY4?=
 =?utf-8?B?QkZ6WEYwWFFMYnFsSzJSSFJYZnVoS3pvbmI5M3dpU0ZFQWFKY3dwSlduTUNw?=
 =?utf-8?B?SG5sbzhQVWkyWWJ5bCtvYjBocURNMTUwSUEvYkNkNWFwUFNjYjJCeVNoNC9D?=
 =?utf-8?B?aUQwdUcvREhRbytReUNRbGR4Y2NNSkNCN1BndUtkMXVJeitrSkJKTkp4L1VW?=
 =?utf-8?B?VzJOM1IyTzhoOFN1dmlZWXZ3L1p3UGdLRDEyYWxWN3l6ZEs4eXRPYlgzOXE5?=
 =?utf-8?B?S1UzRmUrZ2d1WHRqaVlDTHlpWVZLK0NIcWlZNjNidlp1Sk5BOERhTXExS1M0?=
 =?utf-8?B?YjZ2bWVqaEo3QXdOUE84eXY1WXNiaGl4aGNYY1JoSnVCcVlCRFJmbk5oYloz?=
 =?utf-8?B?eHUxeDNDVTFWLzVIQVViaUdYaUtZK0hTa1FzWTE3Q0lrWWY0RkdVNVlWaW1Z?=
 =?utf-8?B?QUZScktGWlhGUHdyVmJYbCtWa1NTZ0lMR3lxVUREZ0hMUEJXOUdlc010RUl6?=
 =?utf-8?B?dmxvN3dGQkk3LzdvLzMwc1VaT3o2eEtBSmJIeThVTGNadGVLZTc0UjNFR0F5?=
 =?utf-8?B?VXVtcUtHNmZYM0s2RVBERW5hZlMzSHJsVWJZWFpWNmtwVGlkK2ZQcFp1ZjlZ?=
 =?utf-8?B?N2tCUzhIbDQ1eEpuUSs4SDdXQklOSUJRMks0ZDByTmlFcG96RVk0L2cydHRy?=
 =?utf-8?B?WGxHV3h5WDFrbWNrU3VTQ0tGTlpFWnJhRHA0ZWVYY0hsOHJPakpPNG5lMmdI?=
 =?utf-8?B?MDdLVmIrbkNPbzJiRE8zOTgvenNjVjJoT0hjWW40M2pnUXpzS3VIN3AwQ25Y?=
 =?utf-8?B?N1BOLzN0amN0ajdNck9vekkyUEt1TmJVMXl5VkdnMi8wT1VJYlpIeWxsVTVa?=
 =?utf-8?B?M0J1T2g1OUFBZDJZSHI2RzZ6SEJzZzJOby9IREthU2w1VTgwMjh3WkMyQjhL?=
 =?utf-8?B?VFNBcGU4RkZsMWt4d1FVazR4RlFoa3NZVFlYVTB2UEdWTVl1blBKaDA5SkNS?=
 =?utf-8?B?LzhxcEhuSTcvLzFDajFBNW0xZWlZemkxL2R0NnZxdXV3WEpSYVZoRTdMd2tD?=
 =?utf-8?B?TFRmRURSUFlNd0kzUFVLcmxsc2Y4ZU02OFZHWXBTUmk5Q1dRaWN4emdsQVg3?=
 =?utf-8?B?M0hrbmd3RlRzK1JlU2N5dE9SOHRSS1ZoQ2ZPSkQwOUpxdXpJTjNuRklqM3FG?=
 =?utf-8?B?R0JSeUxtTVZXSStzbi9VSHBUV3ZTSFo5cTZlRDhNRUQ5MUJwNTVJR1ZBNytP?=
 =?utf-8?B?bU8zTzNzSXFhWU5SQ3hBRkp5WHlqVnp3TVhvWHVkbFJjSEd2eGFETmVaWXVU?=
 =?utf-8?B?cWRwL1pCdjFPTXlyVENrdHNTSTFpeTdueDNuK2YvakpZU0thR2pUS2NwYzZ2?=
 =?utf-8?B?Qkdma3lwRnlFcS9IQzE2YTNFdlNpRVE5SENGTGhEVUVyNnIrV2d3NE0ycm9o?=
 =?utf-8?B?dlhHa1I2cFNmVGIyRVVjNmZwaWVPaWdQY3dvNURxd05jWlVpTlphWWRMZC9q?=
 =?utf-8?B?dGl6aldqM1lwQU12eUdWVFFoYWl2MjZSM0tiNXIrTDZ2bVoxc0cyd1d6emo4?=
 =?utf-8?B?OVFDbjNIU2xzMjZYY3RmU1hQbnI1UWJrQ05BWDB3TnZ3dm1YZ3BHSU1Tc0R1?=
 =?utf-8?B?ZGx0bXc2cnVDUkUvempOOTJlTnhuaTZjbmhVLy9rZlJrWm9kaVFNQ0RObUg4?=
 =?utf-8?B?cXN0eExyZVMrbzRzZnRjaTlIOFpPaEM5em9laGw4TjRvLzFlQ1B0Z3dEUVFs?=
 =?utf-8?Q?2hyRYWgsa9AujFCWjXDEaDQMicT77o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZFF6bmdQa1kyd3liTTRRQm9LNDFlOU9hM3lGSmtvd3Bkcmp4VndsOEN2cXBG?=
 =?utf-8?B?NUgwVWFmTDJFb1QxTlBQWnd3OUFqVmJFbnZ5U1RacGlXbUhLYnRpTW85a3NL?=
 =?utf-8?B?K01MVUZ1YXFwV25xVUg4YWMvOGthdlhZd2F0TWNYaFZ2dHFBQ2U5ODI1U0RL?=
 =?utf-8?B?TVVnUVQ1eDVzdG9PNlhFazlNdGpPMzBaVHZVMGtOalVWN0RJU0QrZmJSc0Vx?=
 =?utf-8?B?N2xhSUNKTllyZFBuRFVwWU9pVy9FSTlmRWRxcVZZZ1krb21lR1FjNU5jWGxt?=
 =?utf-8?B?cTNIOEUxZVFnOERjWHd6a3VpMmlFL2hUYU93d1pxZXhpWm1pWUZKam9PZThn?=
 =?utf-8?B?OFVCQlQ0aWpUcHJScVQwdlJ6ZFltc2dnTEJZcUhQSVRqdkU0ell6Y0wrSHZj?=
 =?utf-8?B?MnYxdVVSaTFoamRGQVBEQ1gweHZXN3BOaUlsS0QxNFlxUCtJdFRrYi9FeEgr?=
 =?utf-8?B?WUYrc1JSV0NRWTdPdjRQV214d01kSVlBOW1HenJmYkRBMS9lNFhiZ29icXlM?=
 =?utf-8?B?cHNQZElKZmt3ejQ5bEJTQVZacFFnNmdNMWJtSERNSTdKbjdxWWVkTTZRUWNN?=
 =?utf-8?B?OUo0VmJFMnJDUExWYlVCL1JwRFpodHloWnp0RmtlRDZSOHlCSUcva0NoU2VE?=
 =?utf-8?B?VWphU0t0L1Q1NEN5UU0reVRtL2Qwc0laQW5vSkZjalZtMEJydEdhSFJ6Um5m?=
 =?utf-8?B?dndDMTRZK2lLc1BZRFFZWHlrSmd3RGhsMzVRMS95ZEwrUmt1RmEzbjBKRmEx?=
 =?utf-8?B?QVRMSGxiaHFkbHlYTUQ5aFZ0bVpXYnpRSFRkRU9ZMmFyQ0JVd09HMWZsSWdq?=
 =?utf-8?B?Z1VEdTcwamtoUjlzelp4TnM3NWVUaTIvVWJOcm5sNHo4YVhKYzVXSk91K2tR?=
 =?utf-8?B?eFhaQ1N4NjZ6T2lIWXNkeWhtTVRYUTdJVEptRlNXQXhTb290eXBtUGFoNzVD?=
 =?utf-8?B?cVNwVThTNlZRT0RhYlZnREhMbG5FZUpLWnRZcTJmcjBMQ1V4MGtJRUJocllz?=
 =?utf-8?B?ZXlsMVNmRUt1QXNsSkJEbnNJby8zQ3ZRT0RlWnJyc2RldmM1TlJkVGN1YnhS?=
 =?utf-8?B?eDg0MjJBdDZYdnFQeVRybjZKeUVCb2YycWhIcWJwbmxycWNoYlAzdjlmdnlR?=
 =?utf-8?B?SzhwbFEzckFKaGNieFZtbXdPUmNxTkpadWU4ME9XYmZlR3RUWDJraDVrVmxU?=
 =?utf-8?B?SllGOGpyQ2dQVlpQUVgrMGx4am9kdEF5SGRDeStBZllxdWpiZk1IK2t2TUNI?=
 =?utf-8?B?YUJINVBjSzIxM1dDbXB0TkJrVlpJcWJJdnkxSWpXYkVjdnQ4UU5VeDg5Z0Jr?=
 =?utf-8?B?dEwwcnlRZENDQkFzeUFXVVgxamZSTW9yS0JGdTd0NktiMVNkd3AxUldVOTRS?=
 =?utf-8?B?T2JzaUpzdWpsSDl5ZzdTelRKeWEwNmZxK2tMaXgwQkxTU1BVQmR1VWJtMUFD?=
 =?utf-8?B?eWpPNDZvYUN4TGtPellyR0xxdG9SWHFNdzNIblJMbTlJV04yRU5KamphK3c0?=
 =?utf-8?B?MHoxZlZCRDd6dGE3bFB2VURLTkoyR2pKZUFTa1Z2U3RVdTI3S3VNNDZPWDd2?=
 =?utf-8?B?MmhqOXBpSDBzK2dpT2xkUnhXNmx4c3ZmYzBpS296QkRlQkI5ZGNOZ1cwMXZL?=
 =?utf-8?B?RGxTYXhLR2tDTHlNdUJ2VEVSUy9aQklkSlh1UGZOUlBVTEZSYnVtVFZTcHJR?=
 =?utf-8?B?ZWlIeCtka3I5R3FCN3dMeWlIVlh5ei80NngyTHppcXJHZDBvR0E5T1dscWMr?=
 =?utf-8?B?VmtKcFU5U0g1b3h4SENIMk1RSUtBdHppY2J1UWdUYVlaaTcyOUdQUmZFQXB2?=
 =?utf-8?B?bWhmQUMrZVkrMWxsejIzVS9DSG0zNElUS3E0M0hyUWkyK3BkQ3dvOGYrZW1o?=
 =?utf-8?B?eE1ya0l3K3g3YWhpL3ZMRFNPVHV0eFlyZzFZSnpoSUJQcG1idHdQSlgyT29T?=
 =?utf-8?B?SlJnUHV3VktaenFQaWg4YWNNQ2JSZ2xhL2hZckRjZXhQL2t2V2R0bUFYeU1j?=
 =?utf-8?B?UTczVUJkR3ZVaS91Y2IwYmJBVXlOQVR1WHpGdWlkaUpkTVo0Q3UxMWRLOWh6?=
 =?utf-8?B?Qk5SdlBHZCtTL1VMbys0ampDOGUxSWxZaXNvaUV3YjQrdUdZTktFbUNWQm5S?=
 =?utf-8?B?STR5NThuR1NhMmkzUmw0SExiWittZW5WYndXbStXSnhPU1lIc20xbW1IckVa?=
 =?utf-8?Q?ZmqrRkf9uTEwUX8JmW4pLr76iqYFRkqPx/Z9OKN3EtEI?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb0155c-60e0-4719-c58d-08dd71cc7b2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 09:55:20.9840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jeTRTEHEObOwnmaOLyY3yEnjnGlyno3kq0+tqYzUmgfy+x0ZElUfVMlMGx2uSu/ZBB/y030T5izak/svvjWTOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8401

SGkgU2VyZ2lvLA0KDQo+IEZyb206IFNlcmdpbyBMb3BleiBQYXNjdWFsIDxzbHBAcmVkaGF0LmNv
bT4NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAyLCAyMDI1IDI6NDggUE0NCj4gDQo+ICJNaWNo
YWVsIFMuIFRzaXJraW4iIDxtc3RAcmVkaGF0LmNvbT4gd3JpdGVzOg0KPiANCj4gPiBPbiBNb24s
IE1hciAzMSwgMjAyNSBhdCAwNTozNzowOFBNIC0wNDAwLCBTZXJnaW8gTG9wZXogd3JvdGU6DQo+
ID4+IFRoZXJlJ3MgYW4gaW5jcmVzaW5nIG51bWJlciBvZiBtYWNoaW5lcyBzdXBwb3J0aW5nIG11
bHRpcGxlIHBhZ2UNCj4gPj4gc2l6ZXMgYW5kLCBvbiB0aGVzZSBtYWNoaW5lcywgdGhlIGhvc3Qg
YW5kIGEgZ3Vlc3QgY2FuIGJlIHJ1bm5pbmcNCj4gPj4gd2l0aCBkaWZmZXJlbnQgcGFnZXMgc2l6
ZXMuDQo+ID4+DQo+ID4+IEluIGFkZGl0aW9uIHRvIHRoaXMsIHRoZXJlIG1pZ2h0IGJlIGRldmlj
ZXMgdGhhdCBoYXZlIGEgcmVxdWlyZWQNCj4gPj4gYW5kL29yIHByZWZlcnJlZCBwYWdlIHNpemUg
Zm9yIG1hcHBpbmcgbWVtb3J5Lg0KPiA+Pg0KPiA+PiBJbiB0aGlzIHNlcmllcyB3ZSBleHRlbmQg
dGhlICJTaGFyZWQgTWVtb3J5IFJlZ2lvbnMiIHdpdGggYQ0KPiA+PiBzdWJzZWN0aW9uIGV4cGxh
aW5pbmcgdGhlIHBvc2libGUgZXhpc3RlbmNlIG9mIHBhZ2UgYWxpZ25tZW50DQo+ID4+IHJlc3Ry
aWN0aW9ucyB3aGVuIHRoZSBWSVJUSU9fRl9TSE1fUEFHRV9TSVpFIGZlYXR1cmUgaGFzIGJlZW4N
Cj4gbmVnb3RpYXRlZC4NCj4gPj4NCj4gPj4gRm9yIHRoZSBkZXZpY2UgdG8gcHJvdmlkZSB0aGUg
cGFnZSBzaXplIGluZm9ybWF0aW9uIHRvIHRoZSBkcml2ZXIsIHdlDQo+ID4+IG5lZWQgdG8gZXh0
ZW5kIHRoZSBQQ0kgYW5kIE1NSU8gdHJhbnNwb3J0cy4gRm9yIHRoZSBmb3JtZXIsIHdlIGJvcnJv
dw0KPiA+PiA4IGJpdHMgZnJvbSB0aGUgMTYgYml0IHBhZGRpbmcgaW4gdmlydGlvX3BjaV9jYXAg
dG8gaG9sZCBhIHBhZ2Vfc2hpZnQNCj4gPj4gZmllbGQgd2hpY2ggY2FuIGJlIHVzZWQgdG8gZGVy
aXZlIHRoZSBwYWdlIHNpemUgYnkgdXNpbmcgdGhlDQo+ID4+IGZvbGxvd2luZw0KPiA+PiBmb3Jt
dWxhOiAocGFnZV9zaXplID0gMSA8PCAocGFnZV9zaGlmdCArIDEyKSkuDQo+ID4+DQo+ID4+IEZv
ciBNTUlPLCB3ZSBhZGQgYSB0aGUgU0hNUGFnZVNoaWZ0IHJlZ2lzdGVyIGF0IG9mZnNldCAweDBj
NCwgYWxzbw0KPiA+PiBob2xkaW5nIHRoZSBwYWdlX3NoaWZ0IHZhbHVlLiBTaW5jZSBNTUlPIHJl
Z2lzdGVycyBhcmUgMzIgYml0IHdpZGUsDQo+ID4+IHdlIGNvdWxkIGhhdmUgYXNrZWQgdGhlIGRl
dmljZSB0byBkaXJlY3RseSBwcm92aWRlIHBhZ2Vfc2l6ZSBpbnN0ZWFkDQo+ID4+IG9mIHBhZ2Vf
c2hpZnQsIGJ1dCBzZWVtcyByZWFzb25hYmxlIHRvIGJlIGNvbnNpc3RlbnQgYWNyb3NzIHRyYW5z
cG9ydHMuDQo+ID4+DQo+ID4+IEFuIGltcGxlbWVudGF0aW9uIG9mIHRoZSBjaGFuZ2VzIHByb3Bv
c2VkIGluIHRoaXMgc2VyaWVzIGhhcyBiZWVuDQo+ID4+IHB1Ymxpc2hlZCBhcyBhbiBSRkMgdG8g
dGhlIExLTUwsIHRvIGJlIHVzZWQgYXMgYSByZWZlcmVuY2U6DQo+ID4+DQo+ID4+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDIxNC12aXJ0aW8tc2htLXBhZ2Utc2l6ZS12Mi0wLWFh
MTYxOQ0KPiA+PiBlNjkwOGJAcmVkaGF0LmNvbS8NCj4gPg0KPiA+DQo+ID4gQ2FuIHlvdSBleHBs
YWluIHRoZSB1c2UgYSBiaXQgbW9yZSBwbGVhc2U/DQo+ID4NCj4gPiAtIGxvb2tzIGxpa2UgdGhp
cyBpcyBleHBvc2VkIHRvIHVzZXJzcGFjZT8NCj4gPiAgIGJ1dCB1c2Vyc3BhY2UgY2FuIG5vdCBi
ZSB0cnVzdGVkIG5vdCB0byB2aW9sYXRlIHRoZSBzcGVjLg0KPiA+ICAgaG93IGNhbiB0aGF0IGJl
IHN1ZmZpY2llbnQgdG8gc2F0aXNmeSBNVVNUIHJlcXVpcmVtZW50cz8NCj4gDQo+IEluIHRoZSB2
aXJ0aW8tZ3B1IGltcGxlbWVudGF0aW9uIGluIHRoZSBSRkMgc2VyaWVzIGl0J3MgaW5kZWVkIGV4
cG9zZWQgdG8NCj4gdXNlcnNwYWNlLiBUaGlzIGlzIGJlY2F1c2UgZ3B1IGRyaXZlcnMgYXJlIHN1
cHBvcnRlZCBieSB1c2Vyc3BhY2UgZHJpdmVycw0KPiAoTWVzYSksIGFuZCBib3RoIGhhdmUgYSB2
ZXJ5IGNsb3NlIHJlbGF0aW9uc2hpcC4gUHJvYmFibHksIHRoYXQgcGF0Y2ggc2hvdWxkDQo+IGFs
c28gbWFrZSB0aGUga2VybmVsIGRyaXZlciByZWplY3QgbWFwcGluZ3MgdGhhdCBkb2Vzbid0IGNv
bXBseSB3aXRoIHRoZQ0KPiBhbGlnbm1lbnQgdG8gZW5zdXJlIGl0IHNhdGlzZmllcyB0aGUgTVVT
VCByZXF1aXJlbWVudHMuDQo+IA0KPiBJJ2xsIGRvIHRoYXQgaW4gdGhlIG5vbi1SRkMgc2VyaWVz
Lg0KPiANCj4gPiAgIHdoYXQgYXJlIHRoZXNlIG1hcHBpbmdzIGFuZCB3aGF0IGFyZSB0aGUgYWxp
Z25tZW50IHJlc3RyaWN0aW9ucywNCj4gPiAgIGluIGZhY3Q/DQo+ID4NCj4gPg0KPiA+IExvb2tp
bmcgYXQgdGhhdCBwYXRjaCwgSSBiZWdpbiB0byBzdXNwZWN0IHRoYXQgd2hpbGUgdGhlIHNwZWMg
cGF0Y2gNCj4gPiB0YWxrcyBhYm91dCBkZXZpY2UgbWFwcGluZyByZXF1ZXN0cywgaXQgaXMgYWN0
dWFsbHkgdGhlIG90aGVyIHdheSBhcm91bmQ6DQo+ID4gdGhlIHJlc3RyaWN0aW9uIGlzIG9uIGd1
ZXN0IHZpcnR1YWwgdG8gZ3Vlc3QgcGh5c2ljYWwgbWFwcGluZ3M/DQo+IA0KPiBOby4gVGhlIGd1
ZXN0IGNhbiBvcGVyYXRlIGluIHNtYWxsZXItdGhhbi1ob3N0IG1hcHBpbmdzIChvdGhlcndpc2Us
IHJ1bm5pbmcNCj4gYSA0SyBndWVzdCBrZXJuZWwgb24gYSAxNmsgaG9zdCB3b3VsZG4ndCBiZSBw
b3NzaWJsZSkuDQo+IA0KPiBTaGFyZWQgTWVtb3J5IFJlZ2lvbnMgdGVuZCB0byBiZSB1c2VkIHRo
aXMgd2F5Og0KPiANCj4gIDEuIFRoZSBndWVzdCByZXF1ZXN0cyBhY2Nlc3MgdG8gY2VydGFpbiBy
ZXNvdXJjZSBvd25lZCBieSB0aGUgaG9zdC4gVGhlDQo+IHJlcXVlc3QgY2FuIGJlIGZvciB0aGUg
d2hvbGUgcmVzb3VyY2Ugb3IgcGFydCBvZiBpdC4gVGhlIHJlcXVlc3QgIGluY2x1ZGVzIHRoZQ0K
PiAnb2Zmc2V0JyB3aXRoaW4gdGhlIHJlc291cmNlLCBhbmQgdGhlICdzaXplJyBvZiB0aGUgd2lu
ZG93ICBpdCB3YW50cyB0byBoYXZlIG9uDQo+IGl0Lg0KPiANCj4gIDIuIFRoZSBob3N0IG1hcHMg
dGhlIHJlc291cmNlLCBmcm9tICdvZmZzZXQnIHRvICdzaXplJyAoYXMgcmVjZWl2ZWQgYnkgIHRo
ZQ0KPiBndWVzdCksIGludG8gYSBjZXJ0YWluIG9mZnNldCBmcm9tIHRoZSBob3N0J3MgdmlldyBv
ZiB0aGUgbWFwcGluZyAgYmFja2luZyB0aGUNCj4gU2hhcmVkIE1lbW9yeSBSZWdpb24uDQo+IA0K
PiAgMy4gVGhlIGd1ZXN0IHJlY2VpdmVzIGFuIGFuc3dlciBpbmRpY2F0aW5nIHRoZSBvZmZzZXQg
KGNvbXBsZXRlbHkgIGRpZmZlcmVudA0KPiBhbmQgaW5kZXBlbmRldCBmcm9tIHRoZSBvZmZzZXQg
dGhhdCB3YXMgcmVxdWVzdGVkIHdpdGhpbiB0aGUgIHJlc291cmNlIGluIDEpDQo+IHdpdGhpbiB0
aGUgU2hhcmVkIE1lbW9yeSBSZWdpb24gd2hlcmUgdGhlIHJlc291cmNlIGhhcyAgYmVlbiBtYXBw
ZWQuDQo+IA0KPiAgNC4gVGhlIGd1ZXN0IHN0YXJ0cyBvcGVyYXRpbmcgb24gdGhlIHJlc291cmNl
LCBub3cgYXZhaWxhYmxlIGluIHRoZSAgU2hhcmVkDQo+IE1lbW9yeSBSZWdpb24gYXQgdGhlIG9m
ZnNldCByZWNlaXZlZCBpbiAzLg0KPiANCj4gVGhlIHByb2JsZW0gdGhpcyBjaGFuZ2UgaW4gdGhl
IHNwZWNpZmljYXRpb24gdHJpZXMgdG8gYWRkcmVzcyBpcyB0aGF0LCBpbiBzdGVwIDIsDQo+IGJv
dGggJ29mZnNldCcgYW5kICdzaXplJyBtdXN0IGJlIGFsaWduZWQgYWNjb3JkaW5nIHRvIHRoZSBo
b3N0J3MgbGltaXRhdGlvbnMgKGluIGENCj4gdHJhZGl0aW9uYWwgaG9zdC9ndWVzdCBzY2VuYXJp
bywgdGhpcyB3b3VsZCB0aGUgaG9zdCdzIHBhZ2Ugc2l6ZSkuIEJ1dCB0aGUgZ3Vlc3QNCj4gaGFz
IG5vIGtub3dsZWRnZSBvZiB0aGlzIGxpbWl0YXRpb25zLCBzbyBpdCBjYW4ndCBhZGp1c3QgJ29m
ZnNldCcgYW5kICdzaXplJyBhcw0KPiBuZWVkZWQuDQo+IA0KPiBXaGlsZSB0aGlzIGV4YW1wbGUg
aXMgd3JpdHRlbiB0aGlua2luZyBvZiB2aXJ0dWFsIGRldmljZXMsIGl0J3MgY2VydGFpbmx5IHBv
c3NpYmxlDQo+IHRvIGltcGxlbWVudCBwaHlzaWNhbCB2aXJ0aW8gZGV2aWNlcyB0aGF0IG1heSBo
YXZlIGEgbWluaW11bSBncmFudWxhcml0eQ0KPiBiaWdnZXIgdGhhbiB0aGUgaG9zdCdzLg0KPiAN
Cj4gPiBEb2VzIHRoZSBmZWF0dXJlIGFmZmVjdCBvdGhlciBkZXZpY2UgdHlwZXMgYmVzaWRlcyBn
cHUsIGFuZCBob3c/DQo+IA0KPiBFdmVyeSBkZXZpY2Ugd2l0aCBTaGFyZWQgTWVtb3J5IFJlZ2lv
bnMgaXMgYWZmZWN0ZWQuIFRoZSBvbmx5IHJlYXNvbiB3ZQ0KPiBmb3VuZCB0aGUgaXNzdWUgaW4g
Z3B1IGZpcnN0IGlzIGJlY2F1c2UgaXQncyB0aGUgbW9zdCBpbnRlbnNlIHVzZXIgb2YgU0hNDQo+
IHJlZ2lvbnMuIFRoZSBtb21lbnQgd2UgYXR0ZW1wdGVkIHRvIHVzZSBpdCBvbiBhIDE2SyBwYWdl
IGhvc3QsIHRoZSBpc3N1ZQ0KPiB3YXMgbWFkZSBjbGVhci4NCj4gDQo+IEZvciBpbnN0YW5jZSwg
ZnMgaXMgYWxzbyBhZmZlY3RlZCwgYnV0IG9ubHkgdXNlcyBTSE0gcmVnaW9ucyB3aXRoIERBWCwg
YW5kIHRoZQ0KPiBsYXR0ZXIgaXMgYmFyZWx5IHVzZWQgZHVlIHRvIHZhcmlvdXMgY29uc3RyYWlu
cy4NCj4gDQo+IE5ldyBkZXZpY2VzIHVzaW5nIFNITSwgbGlrZSB2aXJ0aW8tbWVkaWEsIGFyZSBz
dXJlIHRvIGhpdCB0aGlzIGlzc3VlIHNvb25lcg0KPiB0aGFuIGxhdGVyLg0KPiANCkkgdW5kZXJz
dGFuZCB0aGUgaXNzdWUgbXVjaCBiZXR0ZXIgbm93LiBUaGFua3MgYSBsb3QgZm9yIHRoZSBkZXRh
aWxlZCBleHBsYW5hdGlvbi4NCkdpdmVuIHRoYXQgYWxsIHRoZSByZXNvdXJjZSBjYXJ2ZSBvdXQg
KHdpbmRvdyBhY2Nlc3MpLCByZXNvdXJjZSBhbGxvY2F0aW9uIGFuZCBtYXBwaW5nIGlzIGRvbmUg
dGhyb3VnaCBhIGNoYW5uZWwgb3V0c2lkZSBvZiBzaGFyZWQgbWVtb3J5LA0KYW5kIHRoaXMgaXMg
bm90IGFib3V0IHRoZSBwYWdlIHNpemUsIGJ1dCBhYm91dCB0aGUgcmVzb3VyY2UgbWFwcGluZyBz
aXplLA0KDQpJIGJlbGlldmUgdGhpcyByZXNvdXJjZSBtYXBwaW5nIHNpemUgYW5kIG9mZnNldCBy
ZXN0cmljdGlvbnMgc2hvdWxkIGJlIGNvbW11bmljYXRlZCB2aWEgc2FtZSBjb21tdW5pY2F0aW9u
IGNoYW5uZWwgdGhhdCBkb2VzIHRoaXMgcmVzb3VyY2UgbWFwcGluZyBwbHVtYmluZy4NCg0KUGx1
bWJpbmcgdGhpcyBpbnRvIHRoZSBzaGFyZWQgbWVtb3J5IGNhcGFiaWxpdHkgZG9lcyBub3QgbG9v
ayByaWdodCBwbGFjZSBhcyBpdCBoYXMgbm8ga25vd2xlZGdlIG9mIHN0ZXBzICMxIHRvICM0IHlv
dSB3YWxrIHRocm91Z2guDQpQbGVhc2UgY29uc2lkZXIgdXNpbmcgeW91ciBleGlzdGluZyByZXNv
dXJjZSBtYXBwaW5nIGNoYW5uZWwgdG8gY29tbXVuaWNhdGUgc3VjaCByZXN0cmljdGlvbnMuDQoN
Cj4gVGhhbmtzLA0KPiBTZXJnaW8uDQoNCg==
