Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981F1393DE3
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 15:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.56
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032749; cv=fail; b=igpiav/KgVF/Gp2tAJRJMSDrQ8AVfcJO6549Ns4lLhj8k17yCx2QLrodCbfJ/J9HzxMG8px+99vR+XHkEhKnzQtXJ9r2P030K906uaDBgKUIjNDz2+PW1y4t+oGLVc4kYjTi7oFVcHU088l9kM3eLjrf03hfOyhP0IUsLZBidFk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032749; c=relaxed/simple;
	bh=RfAII1HW4dx6wWv+AQr4AwTpcar26OTMB1/hOcPO7uI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CcNuzOQXmCeQr2sEt5+aWQPnN85DJmHt+0Xj+ADrT0nYocpWk2ilq5EQeZevdM3vHR8tvgoUTHiC+EpOOqpK8B7SX0D0IRUe/5stnKSMRMqqUdqiR+cuy8ga2uYClOivNURDpb3gvs7hM6RHoaiMSf2W5yQZArGyyeRLubdcxTI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Xt5fmPuJ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Xt5fmPuJ; arc=fail smtp.client-ip=52.101.69.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Xt5fmPuJ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Xt5fmPuJ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jSULjNKOm5HMWlOEoVdxZCJ69Cfv2t2sYzLkEZ+X0hZ8WI4OxhWT6Iv2+Ajo90PuAhVlQy+D9XObHuGsKHSVrFuPzpzyPBCdeG+CZc6s6RMhwMv/ac4Mh+5C7wLPsWuf6QdI0/sin2/JFcxZwlX4uoHAyWF+CK1ppwbCjPYkr/z/kPTf9BQoJjgNg2dJ56HMIp6abfIiiMRyNNrp8TnDF9w2kOm0mTAmNburSXXUj066su+BAmGUIBDyicmOAmUyKelpA0Y5xykYiK0KRSRuJVRmmtovttWYz4q/wNZ1PRoWjhNGnl6sAX+tSSNNoOc7wrcc+1P3Qa+nwmvGYF0zXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfAII1HW4dx6wWv+AQr4AwTpcar26OTMB1/hOcPO7uI=;
 b=J4lZnd3Uxz8PYZPSFY0YgO/GKgGo15I1M/KR3Do5BMpcGctimz6vDoYANkr2CimFgbtGN9OPsqTg1hBRKfJfQxKtTJyxpW+KmM31RbjcvQlMOOJwrVDcn/Izc6bBIGaYYynM2ERIWQW+iI+jPxJHDutsySiD3b7VzZjxIzk5+SV/Riv6JY4E7ICaPf9wHNasJiAu9621Wspd4dMxo9dJwg1P1XU+XfryNcRb8Upl76UqsnUPApy0eeaZGlYZ8LfKCbPbKRU7HRKCKh/pvJ1CfoLUZQNMvbiNraWA1jpIeCJYLCCu84nJjCbrmUo1aFY21W4ul2OGIG2W7iqJWuyG3Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfAII1HW4dx6wWv+AQr4AwTpcar26OTMB1/hOcPO7uI=;
 b=Xt5fmPuJAKRvDPB5p97iZbRCZyyKUcV1fGOTaQBhWg4omu/D6zv2NsBZwag1VMeBbNZIpXpZEJsjpODDwLBdD93eoRrXVqG60b10VKBHMuF7ZXBEypixlXiJCVOF6GZMpHlK4pfCmXjUFeqsBBYN07yMOungLTvnrZ6waUd0m3g=
Received: from AM9P193CA0020.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::25)
 by DBAPR08MB5590.eurprd08.prod.outlook.com (2603:10a6:10:1aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 15:19:00 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:20b:21e:cafe::ed) by AM9P193CA0020.outlook.office365.com
 (2603:10a6:20b:21e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 15:18:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 15:18:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slQe/xCWt91r/8xV5fHDcjr1uAIvB8L5GLpQbJDJOQZLGl29I36xBXqJm/R6smHDmebo8mrdPLoRzMQVUZYUOwae+LX/D9p4JxRK984o2Kol5UuOG7Odx/Mb4TNT5+3TGlN8JaoG4kdxu8nbJ2RuPje6bJdGUY8G/RfzkejbMvhgnlNEF9IVgHLKK8pNCHdbIcTwbnlavTd2v9US/QG/rv0YZwq8W8bHGlLQkx8cKiFWCfLgIBZ7jfe4UVKbmr4AaC0EpiTEQtD973GVqbL5Y/cRSsRjBqwCGsCUuAbxFasijv1BNXI3cZBJkv6pIOTA8wX3KaLlQWYJm3no1colUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfAII1HW4dx6wWv+AQr4AwTpcar26OTMB1/hOcPO7uI=;
 b=nZBKNx5OjevfVXVXwohJJAeIwMCLwVQGMN+9Mc1LvPojmlhI+e/9nKmk4tFJtNTTzSrc8C9LOT61kQR4IGoSC6IMyyF3d0Jb4agcXNdefLeSDNig64xkgYCI0QKJPPBFwSYPK1X1lqI/wYMvmtKZ2G+bjPWlJxLJcDtNnm2al+n28AvIwQHLgOlJGH0T29aYo/a+Jk+nGiXvyI8dV7HvP15xY4N7zvQvrfU4HCwf1GVNvg5fda1xleHDfWLs3TIvh8NL8zy4+IAik8Z1Zz1VkGBhOSDuxI0QNVE6T7malW/iAsMbVQxFL+jZdeakRhTlt9SSTgLnygiPkfYE8O5qTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfAII1HW4dx6wWv+AQr4AwTpcar26OTMB1/hOcPO7uI=;
 b=Xt5fmPuJAKRvDPB5p97iZbRCZyyKUcV1fGOTaQBhWg4omu/D6zv2NsBZwag1VMeBbNZIpXpZEJsjpODDwLBdD93eoRrXVqG60b10VKBHMuF7ZXBEypixlXiJCVOF6GZMpHlK4pfCmXjUFeqsBBYN07yMOungLTvnrZ6waUd0m3g=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAXPR08MB7490.eurprd08.prod.outlook.com (2603:10a6:102:2b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Wed, 25 Feb
 2026 15:17:53 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 15:17:48 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Parav Pandit <parav@nvidia.com>
CC: "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index: AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAqpM4CAB53BAIAAMF+AgAB8i4A=
Date: Wed, 25 Feb 2026 15:17:47 +0000
Message-ID: <2E2ECAE2-F7ED-4FC4-84AA-CB456F568DBA@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <478DE38A-8581-4113-9467-227DA3E0D134@arm.com>
 <SJ0PR12MB68067A563A18F69033F32448DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <62E0DF94-3401-42E4-9574-02C557849D44@arm.com>
In-Reply-To: <62E0DF94-3401-42E4-9574-02C557849D44@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAXPR08MB7490:EE_|AMS0EPF000001B4:EE_|DBAPR08MB5590:EE_
X-MS-Office365-Filtering-Correlation-Id: 52d2a3a7-0b34-4b38-f872-08de748133aa
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|7142099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 4r+oGEBGfoO5Oo+M96p5MLpQH+myZoPVWdZEnBJP6S3vbIFaj3M9Mlt793OG6Tay8tZStNCB5SsZ0mSAmiNKl/9bJKTM9pZoQkIYknRI1Ubuid8dS/HSyvjUArCejob28sGeGK2gvBna+eqzqW6SZypvTTd1AK07iv1tHgo6qC02pu8cthrCeMwe+oTGGXIzLYcqj3f+Rw6HtTp74MFVnQoaSL2xjtLniWtVgyr94DkxhTO+Gs37MQI8e6eOdTd7PWkUBDK0la3U3f+Mqya9NrbjQg2obY/xj6PJCu7Acf3kMOCMcbRxck3JZ3LFxrrCPITpenso1vpKtwAr93/PQHC4JCKgocc8sRZLypc1Rtrzma9tw9wd4y3Wjnv9L8K24duhb+lU3qbjTYRzIfnUskPeKz5imQ/D9ccW9o4tSsA/quOs1BcpRQSNQDl0R1eGckCq9Et0wWSCZ5R7SIwWOOglCjUtyKjxV3rhbYhvITSFvByIOsCpi1zgf8+DaZQ1cr7LKDpR8jD8bbCtmsRVAj/FjqQkhFOml0hMdw+F6ra/gLD6eMnMQB+flqsQ3WeVdpJ4yG1ahj+NLoGWfRr2BXdLtNcAtJrtjgztRmB/byn8EVUseugYSi73G05gS1TTgOSamWwxeFIAC9i+NOsitQGm/WUp9zcfxM5Og7Tl4ZAA7hmVM/gO0F8pleOW+c2RG34mJWZ9L+XBgOpknz4XsQvU/gYs+mRN0Oqh7clGi8fikb8OnVqLJEAwNm8Crta5cSybkTSySB8L6PeTF+GytWjMSlxx/kvkd4vzTBCqAUY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7142099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4432949BDE494E40BD633703AFE66BA5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7490
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	072549e8-9510-4f75-6f08-08de748108bf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|36860700013|14060799003|376014|13003099007|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	NAjgI02cgD8nrV3LHmtyXugvtYGzYsK8ijDU080eeiGXXgGHuvEXYuqiezNLcoM9Wv1VSHPnhp5M9LKAIslo9UmuFit2R4LgtXuzWmFOjGKaRYp0SJRcT7Iwtp8N7PSzgXdfw1IvSb+v4RcUWANIbEpMFDLKqx+g86f9EfWB/rEp0vymhPtcAq+xsiQpvieN5/jKFaoo4VLPHaMP6CuRDnbOzdTzm+9Xm+p06dQEZ3n0DaqYVyV00aMY5ChODLiM8PKUuLsBFZdCk+10UQt1q+2Y79r2HIeJEf/TAFepwaQUp7Lhv95/ONq0dkIs2dIdL0OO6n5KPyWAjlY6gNusct6Wn3/OCEX6f6WqsLKJY5wwVFfJOvB8zZHgKqYljeg7uZtH5S0F/uYaH0OovCn1q9NMoRNWxa9BN+QSpnjQMm7fY9e6Q6AgpL05cPbCtYZf7ncY0j1cqkKCTyv1UnXMfz7s4G2PxjDokZbbL0/9y/UDUWZAKQs6SSMO9kkdrjiIU6/C4QcTns/3O03bd/813AN6i/MrySU/wJWNxEs8R8YdoLATeY4ndYoo92XMMoBV26R4Uuwdo+DxjNGPPUbzeFSVtZE086ZQuC+bNSMoM9fnL5Soluxhv4ma4IuzVotsPJIHlD0VnzVjQfE/b49YtHM6PpwuEbbqQYxN+N4rXv5FwpqYD+ATaRPFyNUf3yDvNL5c4k5OjztR1YaCN3CEOWn5IysvWa3VAAUTKIjwYkChwmLF5GDzShORw0zAnj00MFp49BFeXjmXwOYJn4kbi5vYUuNsZlNRfKpVJzhngXIs0g0OSaX3VWjefETUWmL4Gr99wpaxRBI8pICBVCJx0Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(36860700013)(14060799003)(376014)(13003099007)(7053199007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PK8ttQq4dwvxScCop4zatkskfRaxV1UnVgkOi4pys+S2uvlhKaljEbLQcLxZNjskvRVbxpBpTF+WgXPOOvptjCTWLX1PsYFuSScpmssYOe6k3bF4WHxUJPxjaO9IvExkYYC2jGmMIGPGA06G0/UmEAua09AkltiHgTn3DT8y3Zxk3KUpKMjd/BG3Rk+yfWkk9nN44+DDAl4FvWci+SJmsZ9KoBSp1AX1V1tG/MCQQdWGKfBqISk9c9sBblpHtzUDCGBNb7j+5u2/A9DcVOV2UrvgTFAtlkByCC1up+yoxDyWArqUwsmMFRGnvoKBHUsG2F8VNEyoIMjQHWy76zXya4udjj+0Ow9NWIv60xR0Xoj/t/LUnOc2nQmUwKqDVrG7/hjPBgv374vRe05pCkeNpP4Xl0W+DMfUBZv4c/rYiJk2aPYALAtwbZDqRe41A2SC
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 15:18:59.8604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d2a3a7-0b34-4b38-f872-08de748133aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5590

Hi Parav,

> On 25 Feb 2026, at 08:52, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>
> Hi Parav,
>
>> On 25 Feb 2026, at 05:58, Parav Pandit <parav@nvidia.com> wrote:
>>
>>
>>> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>> Sent: 20 February 2026 02:10 PM
>>>
>>> Hi Parav,
>>>
>>>> On 13 Feb 2026, at 14:52, Parav Pandit <parav@nvidia.com> wrote:
>>>>
>>>> Hi Bill,
>>>>
>>>>> From: Bill Mills <bill.mills@linaro.org>
>>>>> Sent: 26 January 2026 10:02 PM
>>>>>
>>>>> This series adds the virtio-msg transport layer.
>>>>>
>>>>> The individuals and organizations involved in this effort have had di=
fficulty in
>>>>> using the existing virtio-transports in various situations and desire=
 to add one
>>>>> more transport that performs its transport layer operations by sendin=
g and
>>>>> receiving messages.
>>>>>
>>>>> Implementations of virtio-msg will normally be done in multiple layer=
s:
>>>>> * common / device level
>>>>> * bus level
>>>>>
>>>>> The common / device level defines the messages exchanged between the =
driver
>>>>> and a device. This common part should lead to a common driver holding=
 most
>>>>> of the virtio specifics and can be shared by all virtio-msg bus imple=
mentations.
>>>>> The kernel implementation in [3] shows this separation. As with other=
 transport
>>>>> layers, virtio-msg should not require modifications to existing virti=
o device
>>>>> implementations (virtio-net, virtio-blk etc). The common / device lev=
el is the
>>>>> main focus of this version of the patch series.
>>>>>
>>>>> The virtio-msg bus level implements the normal things a bus defines
>>>>> (enumeration, dma operations, etc) but also implements the message se=
nd and
>>>>> receive operations. A number of bus implementations are envisioned,
>>>>> some of which will be reusable and general purpose. Other bus impleme=
ntations
>>>>> might be unique to a given situation, for example only used by a PCIe=
 card
>>>>> and its driver.
>>>>>
>>>>> The standard bus messages are an effort to avoid different bus implem=
entations
>>>>> doing the same thing in different ways for no good reason. However th=
e
>>>>> different environments will require different things. Instead of tryi=
ng to
>>>>> anticipate all needs and provide something very abstract, we think
>>>>> implementation specific messages will be needed at the bus level. Ove=
r time,
>>>>> if we see similar messages across multiple bus implementations, we wi=
ll move to
>>>>> standardize a bus level message for that.
>>>>>
>>>>
>>>> I would review more, had first round of sparse review.
>>>> Please find few comments/questions below.
>>>>
>>>> 1. device number should be 32-bit in struct virtio_msg_header.
>>>> From SIOV_R2 experiences, we learnt that some uses have use case for m=
ore than 64k devices.
>>>> Also mapping PCI BDF wont be enough in 16-bits considering domain fiel=
d.
>>>
>>> That is a very interesting feedback, we will definitely take this into =
account.
>>> We will have to decide how big and I will answer that in Demi's mail as=
 there might be some drawbacks with
>>> having very big sizes for the device ID.
>>>
>> I am slowly catching up on the thread.
>> There are two types of device id needed.
>> One is UUID style to uniquely identify the device that may show up using=
 two transports to the driver.
>> With that a driver can create single virtio_device object, which is reac=
hable via two different transports.
>> This offers performance, resiliency.
>> This is likely a bigger string which is not efficient to use during ever=
y message transaction.
>>
>> Second one is: within a transport, a device id to identify the communica=
tion.
>> I was referring to this device id to be u32, so that transport can suppo=
rt more than 64K devices.
>
> We will increase the device number size to support more than 64k devices.
> For the UUID part, I feel it should be something provided as device infor=
mation per device, so
> we could add a non-mandatory field (nil-UUID when no ID available) and tr=
ansfer that information
> as part of GET_DEVICE_INFO.
>
>>
>>
>>
>>> In any case this point was raised by you, Peter and Demi and we will de=
finitely handle it in v2.
>>>
>> Ok.
>>
>>>>
>>>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data transfer.
>>>> For example, a TCP stream wants to send 64KB of data + payload, needs =
more than 64KB data.
>>>> Needs 32-bits.
>>>
>>> The point of the transport is not to transfer data, this should be done=
 using virtqueues.
>> How comes virtqueues live outside of the transport?
>> I don't understand this at all.
>> Transport is supposed to transport the descriptors and data also _of_ th=
e virtqueue.
>
> virtqueues do not really live outside of the transport but are defined an=
d used in the same way
> as they are in PCI or MMIO. The transport provide ways to configure the v=
irtqueues but relies on
> the fact that virtqueue content is available to both sides through DMA, s=
hared memory or any other
> custom mean.
>
>>
>> For example you can see that proposal [1] is nearly complete that enable=
s virtio msg layer over various transports.
>> This includes control operations and data operations both.
>> Patch-4 defines the control operations (similar to this proposal)
>> Patch-5 defines the binding of data operation with the specific underlyi=
ng transports such as tcp, rdma etc.
>>
>> In your case, patch-5 would be for system specific bus such as FF-A or o=
thers that others have acked for.
>> But it must be documented somewhere.
>
> Correct me if I'm wrong but this is centered on transfering virqueue cont=
ent over messages and having
> something that is network friendly. Even though some of the principles co=
uld be reused, I think the use
> case is a bit different.
>
> In our use cases we have remote memory access but what we cannot afford i=
s trap-and-emulate to
> access registers (MMIO or PCI) or a hardware specific solution (CCW) (for=
 scheduling issues and
> performance reasons).
>
> Now what could be done easily is extend the virtio-msg proposal with a so=
lution to transfer virtqueues
> over messages to and answer to this use case.
>
>>
>>
>> [1] https://yhbt.net/lore/virtio-comment/20231023104647.290759-2-pizhenw=
ei@bytedance.com/
>>
>>> Transport is only there to allow access to registers, features and conf=
iguration, the main transfers are to
>>> be done using virtqueues and i would not expect a network driver to use=
 MMIO registers to write network
>>> packet payloads but to use virtqueues for that (as vsock or net is doin=
g).
>>>
>> Very strange.
>> If that is your intention, this transport thing must be renamed to contr=
ol-transport to succinctly indicate its objective is for 'control operation=
'.
>
> The proposal is following what PCI, MMIO and CCW transports are defining =
as they do not mention how virtqueues data is transmitted.
>
>>
>>> So the msg_size here is just to fit transport specific requests.
>>>
>>>>
>>>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMOVED (i=
nstead of READY)
>>>> But more below.
>>>
>>> Good point, we will check that to make this coherent with other transpo=
rts.
>>>
>> Ok.
>>>>
>>>> 4. I dont find the transport messages to read and write to the driver =
memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to operate
>>> the virtqueues.
>>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
>>>
>>> Equivalent of virtio_mem_read/write is provided by GET/SET CONFIG which=
 allows you to access the configuration area.
>>> So those are the equivalent of mem_read/write.
>>> Does that answer your question ?
>>>
>> No. but I understood that what is proposed here is a partial proposal to=
 have transport only for control operation.
>> And data transfer implementation is undefined.
>
> But configuration register read/write which is not going through virtqueu=
es is still covered.
> Can you confirm and ack we do not need any new message added for mem_read=
/write ?
>
>>
>>>> Also, the queue notification message is missing at bus level.
>>>
>>> Queue notifications are provided by event_avail and event_used messages=
.
>>>
>> This does not make sense either.
>> The operations that related towards the virtqueues should be part of the=
 virtqueue operations.
>>
>> By not defining specific bus specific details, we don't seem to gain any=
thing significant.
>> So while transport message are good, it needs to cover virtqueue data ex=
changes too as previously proposed in [1].
>
> Please see my previous answer and discussions with Demi for notifications=
 handling.
>
>>
>>>> But I dont think queue notification via message good idea anyway.
>>>
>>> As said in the spec, a bus can handle this using MSI or interrupts and =
generate the messages in the interface
>>> between the bus and the transport. It is not an hard requirement to hav=
e those done using messages transfered and
>>> the bus can do what it wants, but it must inform the transport using a =
message.
>>>
>>>> We rather need a more higher-level message for virtqueues.
>>>> Such as posting the descriptors to device. And this should translate i=
nto a VIRTIO_MSG_DESC_SEND or bus specific binding.
>>>> Without this msg transport is incomplete.
>>>
>>> I am not completely understanding what you mean here, are your concerns=
 covered by the event messages ?
>>>
>> We need transport messages agnostic of the transport like patch-4 in [1]=
.
>> And transport binding defined for each bus of fabric like [2].
>> So that message interface can support [1] as well by only extending the =
virtqueue bindings.
>
> I do think that we could easily support your use case of transfering the =
messages over network.
> What is not covered by our proposal is definitely virtqueue data transfer=
 but this could be easily
> done as part of a bus implementation without impacting the transport itse=
lf.
>
>>
>>
>>>>
>>>> 5. msg_id to be renamed to msg_opcode, and token to be renamed to msg_=
id as it identifies the msg (as written in the description) in
>>>
>>> We went back and forth on the naming, msg_id could be misunderstood as =
message opcode.
>>> I guess we will have to find the best consensus here.
>>>
>> Ok.
>>
>>>>
>>>> 6. Bus requirements ordering is too strict for implementing any perfor=
mant data path as data response may not be in same order as request
>>> for reads.
>>>
>>> This was pointed out in an other mail and i agree here.
>>> I will investigate how we could make this a feature bit which i think c=
ould be a good solution.
>>>
>> Ok.
>>>>
>>>> 7. VIRTIO_MSG_SET_VQUEUE does not have bit field for individual addres=
ses.
>>>
>>> Set vqueue has an index to specify the virtqueue index but you have to =
specific all fields in one go that is true.
>>> Do you need a solution where you could set some fields to a specific va=
lue to say "keep current" and only update part of the vqueue
>>> configuration ?
>>>
>> I believe so, otherwise it cannot work with existing drivers without dri=
ver side caching them.
>
> I will investigate that possibility.
>
>>
>>>> This requires caching all the values on the driver side before sending=
 the transport request.
>>>> I think it is time for virtio spec to shift to virt queue create and d=
estroy model using the admin queue interface.
>>>> and no need to bring this VIRTIO_MSG_SET_VQUEUE legacy to new transpor=
t bindings.
>>>> It may require more plumbing, but it is cleaner interface when a new t=
ransport binding is created.
>>>
>>> Admin queue useable with the message transport but I would be intereste=
d to understand exactly
>>> the model you are referring to with create/destroy model.
>>> Could you elaborate a bit so that i could understand what messages you =
would expect and how this would work ?
>>>
>> The suggestion is to not use SET_VQUEUE legacy.
>> The suggestion is to use admin virtqueue to create queues and destroy qu=
eues, as they are merely an object.
>> And new transport like your proposal can adapt to the modern style.
>> So only admin queue configuration would be the only message.
>> Rest of the other queues can be created directly using the admin queue.
>
> In a way, set vqueue message could be seen like that as it is a one time =
operation.
> In most cases, drivers are configuring a virtqueue in one go which is opt=
imized here
> as we need only one message transfer.
> If we include the proposal to also have an enable/disable directly in the=
 message this
> could allow for even less messages.
>
> Using the admin solution on top of virtio message is something possible a=
nd not prevented
> by this solution.
>
> In my mind we have an object here as you create/destroy queues in one go =
and the fact
> that a bus can transfer those requests asynchronously gives a solution eq=
uivalent to what
> would be provided by admin vqueues.
>
>>
>> One can say it is orthogonal feature and I agree with that reasoning.
>> The part that bothers me is that the new transport ends up adding some l=
egacy bits like set vqueue.
>
> We still need to support legacy to have existing implementation working a=
nd here we can optimize
> them a bit by not transferring one message per field.
>
>>
>>>>
>>>> 8. We should have the message response header for req-resp method with=
 status code.
>>>> (even though they are plain MMIO writes for pci).
>>>> As opposed to that, proposed messages are doing composite tasks, hence=
 we need the status response.
>>>
>>> You want an error code in the header, is that what you mean ?
>> Yes, in the response header.
>
>>
>>> We went into this discussion while designing this, the main issue is th=
at most drivers could not handle an
>>> error as this is something not possible in MMIO or PCI so we decided in=
stead to say that in case of error
>>> a valid answer must be generated (all 0 when doing get_config for examp=
le).
>>>
>> Well, what is proposed here is a generic transport for future to come.
>> So even if driver does not handle error for MMIO/PCI register writes, tr=
ansport would have commands for future to come.
>> So creating V1 structure in future just for the status wouldn't be usefu=
l.
>
> We do handle that but the error transport is handled by the bus and is re=
turned as an error code to
> the transport (msg send returning an error number) instead of having an e=
rror field in the message.
>
> We felt this design was making things simpler and more compliant to exist=
ing designs.
>
>>
>> For LOAD/STORE type of messages, driver can always ignore the error.
>> The messages are used for bus discovery too which is outside of existing=
 drivers scope.
>> So status is useful there too.
>
> I will keep that solution in mind to replace the current one but please c=
onsider what I said upper and
> confirm.
>
>>
>>
>>>>
>>>> 9. virtio stack cannot handle hotplug devices today, at least Linux.
>>>> So if the intention is to fit into such a system, DEVICE_BUS_STATE_REM=
OVED will not be enough.
>>>> A graceful method is needed.
>>>
>>> Hotplug could be handled, remove is more problematic in Linux (you coul=
d declare a new device instance
>>> at any time and this should work).
>>>
>>> Could you give more details on what a graceful method would need ?
>>>
>> Graceful would need a flow something like below.
>> 1. Remove device request (sent by device side bus)
>> Device continue to operate while the request is serviced
>>
>> 2. Driver acts on the request and unloads the driver/reset the device et=
c.
>>
>> 3. Driver (and device) eventually stops using the device by stopping all=
 the bus activities.
>>
>> 4. Bus driver notifies to the device, it is safe to remove and remove re=
quest is completed.
>
> This is a transport side handling possible depending on what the operatin=
g system provides as solutions to
> handle things this way.
>
> Here we have a generic message saying "this device is out" which leaves s=
pace to handle this gracefully on
> top and this can happen in lots of cases where the device is offline with=
out it doing it knowingly (crash, power
> down, you name it).
>
> In a graceful scenario i would expect the driver to ask the device to pow=
er down through some device specific
> means which would result in the DEVICE_BUS_STATE_REMOVED messages being s=
ent once it has turn
> itself off ending in your scenario.
>
> Do you agree or did i miss something ?

Coming back on this subject, we have one message defined for a backend to s=
ignal that a device is removed.

This is a standard bus message but a specific bus wanting to design a more =
graceful way to handle device remove
could do so without entering in contradiction with the spec.

I am not sure that adding more standard bus messages to handle this case wo=
uld really be needed here as any
bus can do it using its own way (with probably a strong dependency on the u=
pper OS) but without any link or
consequence on the generic transport part.

Are you ok with this and letting the message simple in the spec ?
I am ok to add some kind of mention that this is possible or recommended to=
 do but not specified here for example.

Cheers
Bertrand

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
