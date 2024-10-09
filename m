Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F9F17BB06
	for <virtio-comment@lists.linux.dev>; Wed,  9 Oct 2024 08:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463642; cv=fail; b=QzdVeII+EZqTQHVNU1f+77/m+LQ6WBIDu5MRXG7YDILVeBEeiAXRcL2Iy5a0nzvJXllkRHfMvuqF1MPkOjAI0B0lEBFMEqwngNI7Bh6FhwDC8k3PhpKly3SXW+JfURv3nYx49BvwT9/OZCHTjsu3fNgJ37pcdYUT3cSSKS+sx50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463642; c=relaxed/simple;
	bh=Jno9J26tPkxbaAXuJ9fQwT/4abMKw6mug+b2rNsH0j4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TLxB91twFDI/IWsfB49hmHgD17spK/ablgfYLPodP0WHYW6jdG0DcCqOIY8rQfK+c0woyP9HZIEZ+vuJeZ+weLlGafPtXneM5v4eH5RTf2H8/JokVGCV9A4wh2zYBPygIAfdos9oPg7GqsUuvxyzgBhCXPHLoWOvC2Sz1KphTHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ea2w1vhy; arc=fail smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ea2w1vhy"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4994BNRm032325;
	Wed, 9 Oct 2024 08:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jno9J26tPkxbaAXuJ9fQwT/4abMKw6mug+b2rNsH0j4=; b=ea2w1vhy2kM5xF2N
	WInATdbENT2GzLx49w6a2n9QOTwjUadiMhm8x9WGor4hTL7iOReDL134yKFZCdLL
	f8TlsPcQ1QUpOioES2u/Olpc6s9IEij0xn0PYsNJSdHZjKn6LabISkbPd8BqPWSU
	KC/Ctf+z5l6YTyDGJKX1Aj0l2aN8AqzR6OplkD4sRhG4r9kCXmglzHDVPYeaf24F
	16CdbxDpxvh4hAh419FCE9NFB5WqI0yRjI2EvJdhSNkMkF+AN+OZ0Tlg2vmmkBPq
	duhCD/W8n2pXX8DPEqjbzMXTL8K15uRIsIv7lUjDuTKzIedTtj+BPTUqrqFBduat
	eE+TTw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazlp17012012.outbound.protection.outlook.com [40.93.14.12])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wgs44w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 08:47:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZs0H2y/trFxDnzxvd9bH/c9Ie5E7wG6A9KgNqtsJKkElQvrcrBrY1H575VuqX6hLHr1tat+Cnx5DvPsKiUTV+jgjZjbsHG0N8FsjMZE+LeEtxBGw8HlhuAveCI7jfQBjBmgRFXa1olvHUvwM8Xta1QP5PYXsd5SWIaJcBuPU3EKZ8q3fc+bbrZ+9v/gRFY/vcVeqm7GGvxZsjz4ALJQKZDSWhhL+Y6dQeletlqI+YokYPNb17Vg8T6GidhVyqKKj9v0OfUSV4jEl9NCb+FtzzqzTnne8Hprcp4t7wQOeftrsxQRb+sMO7eHv9X7VQPOzmC3DQutWK6lriIM59LI2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jno9J26tPkxbaAXuJ9fQwT/4abMKw6mug+b2rNsH0j4=;
 b=Q5eR7fs48Z1XqfPmY58q9yTbzjDfU7oNEwS2W1u8tdjFA2qCTpx1L64weCZArqaomCDnGpQonhKy/GA0Q/OW8UlG+YfNg7DI4ci4vI1eMedEsBYFhgRL0UAu3ugnFwjUL2GO8OqMlSnQdX0Si0r3P1bz09xZCJ+pkL5rvavh/Z9NBPVAGe6evR3c0oGDhu5lYhalDJjBBathNbz+5pmwO3TZGwtvsIdlpcIdDEkrmDH7N1j13SvuJH7NgKjKj9X4y1clRF8mfD5584Q5Xzzf7mX7oLtLbtON6X2lNQTPcbgrbGQkAZQP0AisPHCZZZaMNMVIGgYliA+gbD3gEDCAxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MN2PR02MB7007.namprd02.prod.outlook.com (2603:10b6:208:207::16)
 by SA2PR02MB7627.namprd02.prod.outlook.com (2603:10b6:806:148::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 08:47:16 +0000
Received: from MN2PR02MB7007.namprd02.prod.outlook.com
 ([fe80::eab0:b587:3138:f48b]) by MN2PR02MB7007.namprd02.prod.outlook.com
 ([fe80::eab0:b587:3138:f48b%7]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 08:47:15 +0000
From: "Aiswarya Cyriac (QUIC)" <quic_acyriac@quicinc.com>
To: Parav Pandit <parav@nvidia.com>,
        "Alexander Gordeev (QUIC)"
	<quic_agordeev@quicinc.com>,
        Albert Esteve <aesteve@redhat.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        "Aiswarya
 Cyriac (QUIC)" <quic_acyriac@quicinc.com>
CC: "acourbot@chromium.org" <acourbot@chromium.org>
Subject: RE: [PATCH v3] content: Reserve ID for media device
Thread-Topic: [PATCH v3] content: Reserve ID for media device
Thread-Index: AQHbE/HmcELoI5U5U02p413zR13gCrJxyOaAgAxe4SA=
Date: Wed, 9 Oct 2024 08:47:15 +0000
Message-ID:
 <MN2PR02MB70077B40D74FFC3C18E00AF6907F2@MN2PR02MB7007.namprd02.prod.outlook.com>
References: <20240906070833.1949727-1-aesteve@redhat.com>
 <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <e6e04b1b-b1cb-41b6-8d9b-69fe79d8494b@quicinc.com>
 <IA0PR12MB8713B01D403D049991D38072DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
In-Reply-To:
 <IA0PR12MB8713B01D403D049991D38072DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR02MB7007:EE_|SA2PR02MB7627:EE_
x-ms-office365-filtering-correlation-id: b2066725-ad75-4b7c-fa28-08dce83ef9f6
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VUI0S3NEbGZEYVUzZkhtV0cvSFlPTFFCSnhhalpLak5BNWZqWFBmcHp3SUdR?=
 =?utf-8?B?a1RCa2d0OStteVBxWTVuek8wOU9pejFrOFZ2TURxOWg4ekVhS0MzeUhUUy90?=
 =?utf-8?B?NlRiVGIvNGhJRVp3dVJDaktXNi9QU0hTelJCZ1A5OWNTb3VXeGN1c3lPUzJj?=
 =?utf-8?B?bkFZRm5sRlNtZHVhUDFFUlZhaldZTjVjMU1FNHhveDNlZ1kzY3p5OUdlUDNj?=
 =?utf-8?B?Z1QrUHltV0pCMEt3ZTZsbFltV0xPd2V6VnhqYndnZHZVOUE2RG8xcmJrUlNl?=
 =?utf-8?B?dFhLM0dlRyt5b0NVQWV1TG91am9yNXJPbWp4Q0lnNWhDSUFSaDRXK1N5UnlL?=
 =?utf-8?B?Mm14dnFzZW1GUVllcTB4QjJUczJBOWFoSTJDbENJZ2wyQWtOazFPdlJMUGwv?=
 =?utf-8?B?YVZNK0laUlpXcEtiUVo5bmsyZnZST0tMNEx2SnRtczRraVByZkw3cGhkb0xy?=
 =?utf-8?B?TmtWcUtsZ0xDTFE2WC9sdjJ6bllYa3MzdXI0SmpoUW83MWpFMTBldU1qNG9p?=
 =?utf-8?B?TGRhdmlsU0xWeVNnWE51WjIwRy9mVEEvRzhZd3lOZUdoVzVTditjK1JRa1pF?=
 =?utf-8?B?RnFRVU41QUw3Yk15ZnZoMUptQnhZWUxqRXJody9WQ0hUaWNoWDY2VkZZRGRx?=
 =?utf-8?B?V3RQNlJDYTdhUGpzVWVsSW5EeVFoNkVXdGZBamVxTjdkQTFtZ0xJdUNxRVJw?=
 =?utf-8?B?RFI3d0ViRk5TVklIZ0ZzY0VPRHUvOUU2YTZpREFkS3h0TWJ5ajlBLzNyYmc2?=
 =?utf-8?B?TzVxcHUzb2RRM0hONDBrak01dSt4YldwSllNQ2MreWZxYTFSMVdXWHhDTFF4?=
 =?utf-8?B?WXVjd0FZZTJoWG53aFUrMjE1V0dSL3BPdlNGaEhjeHBUcVVyWVdSZHE4U2Fz?=
 =?utf-8?B?Zi9wZGNROTFtREVoYkc2bXVNN1BMcUJJZ0dsUWVaYWNrWXNFOG9sSFBid3dp?=
 =?utf-8?B?ajQ4OGozUDcyNlVsdHpjQzNid2djTmlBT0RNNzRKRC9vZlNLcHB0c3BGREFL?=
 =?utf-8?B?YlZCVkZaYmRhRGNGT1Z2YzZWMDB5RVd2ZEJVOWtTa3lVYTVaOHlqMEh1RkZH?=
 =?utf-8?B?RFpnVHZnQ2hmKytmWm9GWlk5SWlnTmF3TGNiWkJDZEYyWVBFaWQ1QXNZUUl4?=
 =?utf-8?B?Vk9uRGVhbUFSM3VUVmk4S0dpRUtDMnF5YXJWRHc3c25JdDhrMVBwbm01Y3BW?=
 =?utf-8?B?ZUQ4UmtOK0YvRWlQc2dZa0JxZUIrK1RVTXp3cW01UFg4UG1KV3hhaC9YdzNJ?=
 =?utf-8?B?c2FjbzZQRE82M2pqVWtRVWJWdXRsR3lZWFNqUmFJY0hrRHJoQXBMcmhYZFdw?=
 =?utf-8?B?b3RGbGsreE5pU0tYSG5ZWnBZOEJCZ1BLWVhYOG90MTZrakJJcTlySGkrQXZw?=
 =?utf-8?B?bkRLa01Vc3FkdlBiZG1YNUdYa0k5VFF0UEE1Nk1RS0huZ2NYcFhlbGo1WjF4?=
 =?utf-8?B?d0FZZExOandCdW4yV3V1QnRSTnFlVGRTWG9JVHVNS05Oa09nZ2FBbm5haGVJ?=
 =?utf-8?B?ME1DSGFjZEVrTU83ZDNhS3VFUVREamVqV09oZ1FiK2p5SEhtNHN2L0NqVjB4?=
 =?utf-8?B?Y2Z6c0gzQllnT3hBWHArRUVEMXp3dDQvNks3d09XYUw1V1d2T1BncitPOVE3?=
 =?utf-8?B?ZGFHY05QZDJ4VmszVUV3UUlBMGswQWJvZnpkemhMUm1nTGRGc3h6bTV0NWNl?=
 =?utf-8?B?UEZlWFlvblFnMnVrSjlJOW5zRllXYnh1MStpU3RwcFp4a0dKVWJqM3FBaHBQ?=
 =?utf-8?B?Y1prenFMbkFDb0JDVXB5QnZySTFmd3VPZTJwNk5LeEgyVjdyb09lRGJCTnRm?=
 =?utf-8?B?dDRtdlFtR1RsNVl0V3FEQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR02MB7007.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?STF3bnUxTElRMGJIekNrY1JEaTJSR1UrRlFXdjBzY29xeXRmaDFmY3Y3VDEz?=
 =?utf-8?B?MnRYMWUvd2c0b0FKNmhmMitVaEthVkk5a2c2UTBHdXVZck9RQjVJYXBmLzVl?=
 =?utf-8?B?a3B1djZlcHlwUlJkaUg0MTFTTlVMc3FEdGREazlHekhoU1poRnY5aTluQUhz?=
 =?utf-8?B?aFBtSVQzVEVwSktyVHp0RWFhV1FnTDByN2QwS25jbkpYVE5xbENvdzNzSzJL?=
 =?utf-8?B?Wk9RazY5TFZHbm85ME9kTHNSNUxuWGEvKzQwaC9xcXp6c001LzcrdlZGektV?=
 =?utf-8?B?VXQrNEhMOC9KbHh3KytvZW9CTUtHVXhETU5leTVndEFJVUVMUG5lM2VKZDNs?=
 =?utf-8?B?akwrNHlzdndEZ3ZmTUZkWWRpdUpGZlFXcHFybmcwVEFHb0JBN1ZvSUNkM3hU?=
 =?utf-8?B?R200dFFra0JLeC8vWmZBalFUQjlCMm5LNlo5YmF2YXQ4NVJoSUs5Sk9yTnJh?=
 =?utf-8?B?SzdrMVJWb1F3WWJBcExIaENyZCtuQ3lyR2JMbDYxMFlTOW1NWjM5cS9mZzJa?=
 =?utf-8?B?Y3cyY2lBaHhjMmg0UGdjOW43M3BnMlhnZ3UycTRoclpNN09aQ0xkbHZpeHNk?=
 =?utf-8?B?cTA3ZFYxODdTSnU3dkZCR1JSaG5YcE1HK2k5YmUzUU9ManEvckpxQmxqcy9F?=
 =?utf-8?B?WXVHNnpDVHA4VjNiN004dTNDYUVMZVNJcFhaaThmRUZwbjN3VTJERFdFVFJQ?=
 =?utf-8?B?K3JpUm8rNG95Y0gvNG9zdWZQS2tWMWdvRWxOblliNjlRQjk5U2pNNmdBUnhH?=
 =?utf-8?B?YlhOMXFUMkw5ZVRxUGxJSHBWWUVkcnlWUENVRHZhZ3doWXFtN3VRL25iejla?=
 =?utf-8?B?bTdGZktUa1FlYnk1eUVOdHg5aWN1R2l4WEVMcVd6TEdsbU9hSzlnNGx2TTk4?=
 =?utf-8?B?SVEyanFzU04ySTlzd3dyUDkxWnI4TVpmdkZidEViV05IMlJ3dnNZYmEzOWxm?=
 =?utf-8?B?ZmJuMUd0M0x6VUdsVVpmOGNWVi90QTMybVUzUExXWGtueXFKaTA4YWVkSGhL?=
 =?utf-8?B?djZHaFVYMHhkbW9wTld2T0RSMk01NWt6ZUtVbmd0aWhEZSttVWpkNVNNSGIx?=
 =?utf-8?B?SzlhOFRDcG1MWjRvMXRtL1dUOVl2NExVVmhOOElkWnpoRHplSk83Tzl6MFQ5?=
 =?utf-8?B?QXJMNS8xVTlHMU1DRjk0SmpjZjBQS0xUUklDTkFzQ05wSk40eTZpMDFpb0hF?=
 =?utf-8?B?SlFqb3prK0RwUlp0RGdqWjIweEI3TVhqbk5wclRnSlVLc0NGdURMVGlTM2ZK?=
 =?utf-8?B?ZWNFRDFOWXkzM3A4N1FEeUpoY0FnclpEaFJJM0RwZnZIbzV4dWtON1E0TzRa?=
 =?utf-8?B?QUNEaUpSV1U0bzRSUjRvbXlkOUJia25LWU1tSjhKMURveHhIQ25Ramcvc0xh?=
 =?utf-8?B?VlV2RnV4bzV5MU9NeDNyL2ZXL0syc3UrOFdlbXM4S2lPdzhYRCt0c1hDaFRT?=
 =?utf-8?B?L0t2cmg1OVlJK0xEN3lhMDUwSXA1SUtUeFgrVnBrdjdNSlpYRXhldFpQZStY?=
 =?utf-8?B?aXFrY3d2V3lHQ1A4K2g1cGk1ZGxLSVQ3WjM1L1RQNjNBWGk0dlBGbzBEQUVM?=
 =?utf-8?B?Mm9wbHZDd05kR2pscWU0eUFPRFdjTk10eGJqYnFseWZWeTJJSjVmYUZ4ZHBM?=
 =?utf-8?B?bHptYnplbEZuY3JOM2NaUWlTUTlEMEFWeGxhRFBBYzRwY0Z4djNDY0wzNjB3?=
 =?utf-8?B?S3BxaHJJU21PK3ZyU2FJWXptUFdZNTRTNGprZE1sdHVaSmZJa213aUdmK3k3?=
 =?utf-8?B?eTd2bUs1TElZYmp4emxiZTZaTnAvZ2tRWndrOC90ZGo2alFpODVXYUcwZGd2?=
 =?utf-8?B?T0R0NjhJSjM1aDg3MWNuSU5NRVhFU1dubkdYOWt0TDJGWHZtUTlxbkxVMUZk?=
 =?utf-8?B?OWwrdUV2SVdKZ3Y1S2xGczk5RnZXc3ZXck05WG03RWdqUGlrZ0hYaTZyZGlt?=
 =?utf-8?B?UXYwUHg4bWZ5UTN3amgxRzFySEZkWkdhM2dCMW9NcXdKMU5ubHc0RkxIc0pM?=
 =?utf-8?B?SDR0Szk4K3N0WFdzNnhMbzZwdDVrdCs1b3hNYTZnS2czdzZDZ0Y5bDhYbHl0?=
 =?utf-8?B?a0h0MFo2WmZkSHllVmhxYnE0ZW1uVUE0QWhTVi9wQXY1d3dOWTUwRzJHdHlu?=
 =?utf-8?Q?/T3fWM+APQfvSs3dYcAW9Ux/L?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T1UHhSU22RcW7biX3hF+psDpSpGzlpOkXRIX2ZMSs420EfZEZo+gF0glNdZbkD18w6SGOqW9UVJ74i786QS/LRvm+q6fDktwsbHYXWh6B6UJ35mf6PtfVd3RgmOHwrLcHdJ/OhwA3AivNl4ozuKUW0X985Nok/RK+BZ+MDzJQ4bO8pbFY/HVr/2R0MphKvAlw23A/ypYHw00zAQWob/NtroELq20FpFfBxpjVXxaqH4NabaOieCvSZInxpyyJjSZ+WFDhQOppl5Rhs5P3BNHjzuGare5oYD+lSmo+A4BPQgJFf9qOsBtt6VZmO1t19D9cqMNidNdBs8G780rgZc14dO0Y424Gf3Ea0N7VjlNErR5DdqhMk3sspAdPwHJYp1Jzw/E14i3S8SHATPF9an69wUP/Pv3hE4GITLnPfdDiXaf1iQIRhLNMyyuxFkAWN1v34IP6yst4H+5PpbZ5hLSHQGFDdV0YlmrXYkbB/fDSjvReGXMlcMTvDItv7vqzWlO1eBAsPUR75L0h+A9EphS6nq1ySGjW+MFRkK8msYUEqs64i5i2QhEK3aFbrc2RZGp5pXqXOtK6oosHXV+24Ub5c9EjauPX4zYO94CpmSZyFmH9gtMo4LzR34GnVJcg88G
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB7007.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2066725-ad75-4b7c-fa28-08dce83ef9f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 08:47:15.8655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VuNOGAOA291Wosfyd3l8A6BVRRDDx1tNM2lkO2A3sabm3AS2PbzJaRwXqsUhRxk+ancMyTOeTT1onj21vR9AVqki8bXCXZWjqk+dAO3i3rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7627
X-Proofpoint-GUID: _o9JsacPifK6vC8nn00mE2GEr6vi7gX0
X-Proofpoint-ORIG-GUID: _o9JsacPifK6vC8nn00mE2GEr6vi7gX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1011 adultscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090057

SGkgUGFyYXYsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGFyYXYg
UGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDEsIDIw
MjQgMTo1MyBQTQ0KPiBUbzogQWxleGFuZGVyIEdvcmRlZXYgKFFVSUMpIDxxdWljX2Fnb3JkZWV2
QHF1aWNpbmMuY29tPjsgQWxiZXJ0IEVzdGV2ZQ0KPiA8YWVzdGV2ZUByZWRoYXQuY29tPjsgdmly
dGlvLWNvbW1lbnRAbGlzdHMubGludXguZGV2OyBBaXN3YXJ5YSBDeXJpYWMNCj4gKFFVSUMpIDxx
dWljX2FjeXJpYWNAcXVpY2luYy5jb20+DQo+IENjOiBhY291cmJvdEBjaHJvbWl1bS5vcmcNCj4g
U3ViamVjdDogUkU6IFtQQVRDSCB2M10gY29udGVudDogUmVzZXJ2ZSBJRCBmb3IgbWVkaWEgZGV2
aWNlDQo+IA0KPiANCj4gPiBGcm9tOiBBbGV4YW5kZXIgR29yZGVldiA8cXVpY19hZ29yZGVldkBx
dWljaW5jLmNvbT4NCj4gPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDEsIDIwMjQgNDozNiBQTQ0K
PiA+DQo+ID4gT24gMDEvMTAvMjAyNCAxMDozOSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+ID4N
Cj4gPiA+DQo+ID4gPj4gRnJvbTogUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29tPg0KPiA+
ID4+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMSwgMjAyNCAxOjM1IFBNDQo+ID4gPj4gVG86IEFs
YmVydCBFc3RldmUgPGFlc3RldmVAcmVkaGF0LmNvbT47DQo+ID4gPj4gdmlydGlvLWNvbW1lbnRA
bGlzdHMubGludXguZGV2OyBhaXN3YXJ5YS5jeXJpYWNAb3BlbnN5bmVyZ3kuY29tDQo+ID4gPj4g
Q2M6IGFjb3VyYm90QGNocm9taXVtLm9yZw0KPiA+ID4+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjNd
IGNvbnRlbnQ6IFJlc2VydmUgSUQgZm9yIG1lZGlhIGRldmljZQ0KPiA+ID4+DQo+ID4gPj4gSGkg
QWxiZXJ0LA0KPiA+ID4+DQo+ID4gPj4gRnJvbTogQWxiZXJ0IEVzdGV2ZSA8YWVzdGV2ZUByZWRo
YXQuY29tPg0KPiA+ID4+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDI1LCAyMDI0IDEyOjIw
IFBNDQo+ID4gPj4NCj4gPiA+Pg0KPiA+ID4+IE9uIEZyaSwgU2VwIDYsIDIwMjQgYXQgOTowOOKA
r0FNIEFsYmVydCBFc3RldmUNCj4gPiA+PiA8bWFpbHRvOmFlc3RldmVAcmVkaGF0LmNvbT4NCj4g
PiA+PiB3cm90ZToNCj4gPiA+PiBSZXNlcnZlIGRldmljZSBJRCA0OSBmb3IgbWVkaWEgZGV2aWNl
Lg0KPiA+ID4+IENvbXBhdGlibGUgd2l0aCB2aWRlbyBlbmNvZGVyLCB2aWRlbyBkZWNvZGVyLCBh
bmQgY2FwdHVyZSBkZXZpY2VzLg0KPiA+ID4+DQo+ID4gPj4gU2lnbmVkLW9mZi1ieTogQWxiZXJ0
IEVzdGV2ZSA8bWFpbHRvOmFlc3RldmVAcmVkaGF0LmNvbT4NCj4gPiA+PiAtLS0NCj4gPiA+PiDC
oGNvbnRlbnQudGV4IHwgMiArKw0KPiA+ID4+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQ0KPiA+ID4+DQo+ID4gPj4gZGlmZiAtLWdpdCBhL2NvbnRlbnQudGV4IGIvY29udGVudC50
ZXggaW5kZXggMGE2MmRjZS4uNmQ2YjNkOA0KPiA+ID4+IDEwMDY0NA0KPiA+ID4+IC0tLSBhL2Nv
bnRlbnQudGV4DQo+ID4gPj4gKysrIGIvY29udGVudC50ZXgNCj4gPiA+PiBAQCAtNzM5LDYgKzcz
OSw4IEBAIFxjaGFwdGVye0RldmljZSBUeXBlc31cbGFiZWx7c2VjOkRldmljZSBUeXBlc30NCj4g
PiA+PiDCoFxobGluZQ0KPiA+ID4+IMKgNDXCoCDCoCDCoCDCoCDCoCbCoCDCoFNQSSBtYXN0ZXIg
XFwNCj4gPiA+PiDCoFxobGluZQ0KPiA+ID4+ICs0OcKgIMKgIMKgIMKgIMKgJsKgIMKgTWVkaWEg
ZGV2aWNlIFxcDQo+ID4gPj4gK1xobGluZQ0KPiA+ID4+IMKgXGVuZHt0YWJ1bGFyfQ0KPiA+ID4+
DQo+ID4gPj4gVGhlIGlkIDQ4IHJlcXVlc3Qgd2FzIG1hZGUgc2V2ZXJhbCBtb250aHMgYWdvIGlu
IE1heS0yNCBmb3IgdXNiLCBubw0KPiA+ID4+IGZ1cnRoZXIgaW50ZXJlc3QgaGFzIGJlZW4gc2hv
d24gb24gaXQuDQo+ID4gPj4gQmV0dGVyIHRvIGF2b2lkIGhvbGVzIGluIHRoZSBkZXZpY2UgaWQg
YXNzaWdubWVudC4NCj4gPiA+PiBTbyBpZCA0OCB3b3VsZCBiZSBiZXR0ZXIgdG8gdXNlIGZvciBt
ZWRpYSB0aGF0IGhhcyBpbnRlcmVzdC4NCj4gPiA+PiBBZGRlZCB2aXJ0aW8tdXNiIHByb3Bvc2Vy
IHRvIHRocmVhZCB0byBzZWUgaWYgaXQgaXMgc3RpbGwNCj4gPiA+PiBpbnRlcmVzdGluZywgaW4g
dGhhdCBjYXNlDQo+ID4gPj4gNDkgc2VlbXMgZ29vZCBoZXJlLg0KPiA+ID4+DQo+ID4gPj4gR2l2
ZW4gdGhlIHZvdGluZyBoYXMgc3RhcnRlZCwgSSBhbSBub3Qgc3VyZSBpZiB0aGUgcmVhbCBpZCB2
YWx1ZQ0KPiA+ID4+IG1hdHRlcnMgYXMgbG9uZyBhcyBvbmUgb2YgdGhlIHVuaXF1ZSBpZCBpcyBy
ZXNlcnZlZC4NCj4gPiA+Pg0KPiA+ID4+IEFuZCBkbyBub3QgcHJlZmVyIHRvIHJlc3RhcnQgdGhl
IHZvdGluZyBmb3Igc3VjaCBhIHNtYWxsIGNoYW5nZQ0KPiA+ID4+IGVpdGhlciBvbiBteSBsYXRl
IG9ic2VydmF0aW9uIG9mIHRoaXMgaG9sZS4NCj4gPiA+Pg0KPiA+ID4+IEkgdGhpbmsgd2hlbiB0
aGUgbWFpbnRhaW5lciBtZXJnZXMgdGhlIHByb3Bvc2VkIHBhdGNoIHRvIGFzc2lnbiBpZA0KPiA+
ID4+IDQ4LCBzaG91bGQgYmUgZmluZS4NCj4gPiA+Pg0KPiA+ID4+IE1pY2hhZWwsDQo+ID4gPj4g
QXJlIHlvdSBvayB0aGlzIHdheT8gT3IgeW91IGhhdmUgYmV0dGVyIHN1Z2dlc3Rpb24/DQo+ID4g
Pj4NCj4gPiA+PiBBaXNod2FyeWEsDQo+ID4gPj4gSXMgdmlydGlvLXVzYiBzdGlsbCBpbnRlcmVz
dGluZz8gSWYgc28sIGNhbiB5b3UgcGxlYXNlIHJlcXVlc3QgZm9yDQo+ID4gPj4gdGhlIHZvdGU/
IFNvIHRoYXQgd2UgYXZvaWQgdGhlIGhvbGUgaW4gZGV2aWNlIGlkIGFzc2lnbm1lbnQuDQo+ID4g
PiBJIHJlY2VpdmVkIGF1dG8gcmVwbHkgZnJvbSBBaXNod2FyeWEncyBlbXBsb3llciB0aGF0IHRo
ZXkgYXJlIG5vdA0KPiA+ID4gcmVhY2hhYmxlDQo+ID4gZHVlIHRvIGFjcXVpc2l0aW9uLg0KPiA+
ID4gU28gbm90IHN1cmUgaWYgdmlydGlvLXVzYiBhbmQgNDggaXMgc3RpbGwgcmVsZXZhbnQuDQo+
ID4NCg0KV2UgYXJlIGludGVyZXN0ZWQgaW4gdGhlIHZpcnRpby11c2IgZGV2aWNlIGFuZCB3b3Vs
ZCBsaWtlIHRvIHJlc2VydmUgSUQgNDggZm9yIGl0Lg0KSG93ZXZlciwgSSBwbGFuIHRvIHB1c2gg
YSB2ZXJzaW9uIDIgcGF0Y2ggdG8gZW5zdXJlIHRoZSByZXNlcnZhdGlvbiBjb3ZlcnMgbm90IGp1
c3QgdGhlIHZpcnRpby11c2IgaG9zdCBjb250cm9sbGVyLCBidXQgdGhlIHZpcnRpby11c2IgZGV2
aWNlLg0KDQpUaGFuayB5b3UNCg0KPiA+IEluZGVlZCB3ZSB3ZXJlIGFjcXVpcmVkIGJ5IFF1YWxj
b21tLg0KPiA+IEFGQUlLIHRoZSB3b3JrIG9uIHZpcnRpby11c2IgaXMgb25nb2luZy4gQWlzd2Fy
eWEgaXMgb24gdmFjYXRpb24gbm93LA0KPiA+IHNoZSdsbCBiZSBiYWNrIG5leHQgd2Vlay4NCj4g
PiBJIGFkZGVkIGhlciBuZXcgZW1haWwgYWRkcmVzcy4NCj4gT2sgU28gd2Ugd29uJ3QgaGF2ZSB0
aGUgaG9sZSBiZXlvbmQgZmV3IHdlZWtzLiBUaGF0IGlzIGdvb2QuDQo+IA0KPiBUaGFua3MuDQo=
