Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F601CD15
	for <virtio-comment@lists.linux.dev>; Wed, 30 Apr 2025 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746010458; cv=fail; b=AtyDExvMw2AfZ+34c44BjJErG4RJE76YwaK8iqs0Fj899gfc4WXcnSc6oR/sJ5vBgDoSlSilDObPibFjnIxNB1kxmiyL9MPIh6qFKqhVLmxamES3CgnkuARSyZqHCiFiL8Uy4lbME/5IIaDkVMsd7bs5Hx9maa34zc2PPzCCgRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746010458; c=relaxed/simple;
	bh=Ut3D5KZqqN6r/kO+VjHvvRqr6snzJwTbpPzKCBgvpto=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TP1U6YDtR3yTFRm5pp1TA4v/3gM1ecziRGj5sP/qflGbN55IGQnGMGCwqqFq8CmHV2WbgavzjSSSJum7K9QIHK44FKjz0JtDXPp9B8xCV4+UXLbvojNp60ew9oK8LtnHJPkRORwyq2ivBLC4yvfIGQi55gBV4jpyas5qCYgv3pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ureHo6q2; arc=fail smtp.client-ip=40.107.223.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ureHo6q2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lm94COJu0udMdn5zwuWR4c2xB2t0diSqmZK90KXjA9ohQ6mgwh1vWtKGF7Xy9k1xXlxTddluAyyiSvlu9M2vCCSB3t4hqpnlYLIKFuwKOkcAu1WzMFGCRgr6X6Xc+u7szTtIqc+aKNRsJo9HRAh7Z80+2bd5UPzbMMKn8EY4rVufUc4iLjozmbEh/bazkfEoewcFL3ybVoi0GdCE28wgJqZmDE0tkfLtIDM+I1Llg/YrrC0ejyjbrdjc73Dl/hOX3fyIwm7oa8KjzpBglJ+WmfjCLABFJLxo7QBGB006JoSbaWgGRjQI/bNc/aGHBuZCpmhxsjr9ARx9qgp5wit8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut3D5KZqqN6r/kO+VjHvvRqr6snzJwTbpPzKCBgvpto=;
 b=So2y9AeOsaLL1QeyshU45j+FddJ+ymmmZkSzRXrUUIIgRb0cWrpozEeiqeeoVeA+Qumxdr3chXldCE3XNIZV+qpkJpubbFWYGZpwD9qH+Fb2Hkj1rewgI5utkzCWcuO+nVQG8bBuIOopz9qPO1c82M4gQxJflul6gPVUSh1aROb/QoRGpr83G01AkkYtWl8G+1R6q8xaRC4MsjiVqQBUiZWJ/0L6WF4TKxLwJJO32b/Pniezj9O/ju9jKhxExka4TXxWkpbPUekYZ3Pkc1QVnDPiylirdv2pImDQaNadjtZAlxsFnBjILmw4zgnLwOHnaBNQcrZ/fE9Lvzja0sfOng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ut3D5KZqqN6r/kO+VjHvvRqr6snzJwTbpPzKCBgvpto=;
 b=ureHo6q2Y7GTrkycoryN9JiF0L7rmojpvrW9R22jdNQjpsyYg47rnc9MumPd1wYwiFtm/caHfOhnpsUFcdjJbMS7yJd7Th/I8PX+DPmyQxsdh4Pbj/Yc9120OKmyFBdRTwnwL1CF/CIx1Nl3syMJMRgQ22Vy9Qz3ossTKZlpdh87QVj/lc8SwKCJ2m9+r92I/rEWHEEYLqSWwUGJALmxxr3CHBcmn5nL1+uB9rF8jjT9dNvj0roYXmbh6jVIcD7ToO1b2iihN06dW8C9hUufI412uNhGOWY0dC9jb/IDpfJuuU271qrkpnxe3Ym0KKfXJBHWEmdLLxEnhXEea+ZRow==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 10:54:12 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 10:54:12 +0000
From: Parav Pandit <parav@nvidia.com>
To: Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, Jason Wang <jasowang@redhat.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Willem de Bruijn <willemb@google.com>, Daniel Verkamp
	<dverkamp@chromium.org>
Subject: RE: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Thread-Topic: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Thread-Index:
 AQHbb7qQTK1IFlk3mUyW0rZK+XznHbOwfmOAgADIVQCAALOCgIAAG2mAgAc9KICAAlyQAIAAgdHAgABgHoCAAAjkMA==
Date: Wed, 30 Apr 2025 10:54:12 +0000
Message-ID:
 <CY8PR12MB7195E87CBF30EB5C7705835DDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250126062058.13695-1-parav@nvidia.com>
 <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
 <20250423014257-mutt-send-email-mst@kernel.org>
 <CABVzXA=Uof+TdU6H+eoiOOVjCZwfXfnLV8wAMP87Gz4G92fncA@mail.gmail.com>
 <20250423140404-mutt-send-email-mst@kernel.org>
 <bb5dd95a-15d5-4785-822c-e2b1e773950c@redhat.com>
 <20250429164256-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195AB46624A4339A305BE1CDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
 <68c4e73a-fa9e-4e2e-8c38-ed4a322bf47e@redhat.com>
In-Reply-To: <68c4e73a-fa9e-4e2e-8c38-ed4a322bf47e@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MN2PR12MB4390:EE_
x-ms-office365-filtering-correlation-id: 2de3bdec-3a5b-4310-0761-08dd87d55772
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c2xUNnNYWkJiNkRoNy9jVS9xS0ptZGZ0d3pXekUxd2oraVd6cUhUTVdTdS81?=
 =?utf-8?B?SHdpclRrMUVGUDE0dHlIanhSZ29MK2FDYW0vTnFSTzhXUjg4YnVFazdPN3Ux?=
 =?utf-8?B?ZXBiZEtrY3JZSVF5ZlJudFhSMFo0QytDWHpFeURDN2tuY21wQ24rYlhReDEy?=
 =?utf-8?B?bzJmQ0N3eTY0dS9xSjkwQnA1bkRTcTJTcWpSYWZFc0U4R3pSZG1qY3lyS0V5?=
 =?utf-8?B?NDNnVSt3cUNvVjJnYWJaWjVSbnJqZmYxaTBGUU8vUHZqTk5MMEpmL3YrVDQy?=
 =?utf-8?B?VmhBVjdrbkRhRWttTzdCdWJYZHdZeldManh3VG1iUHd6bEE0cVJCREhEdUhy?=
 =?utf-8?B?V0hXK3RXVnZXanpVVDBORzhqRnZSZzRFYVZsOC9Wd1FMYVhad2hnTC9xV0RX?=
 =?utf-8?B?VlRJWnhrdEUxTHdNMmJ1cW1aLzRQL1VvWTdZcVQwRlY5a1Q4QVdXcm5DUEVY?=
 =?utf-8?B?WERJWkk0ZUFURFZmaWZ1YTNmdk5QeUdoL2gzZlAyU2dOZnVrcFNIclZUZmM5?=
 =?utf-8?B?VElNa1AxT0VIMld6ci9rMjF1TjBzWndXY0ZKaGUrcnVRVlBWSTJSVlpKcEJN?=
 =?utf-8?B?QWtLMVhXRFJQZElJeXh0V08vWk4zSC9ZODJkRExGalNEWEhxSEpYRlZoUG1y?=
 =?utf-8?B?UUpiMm1TMHI1UG5QNjJCZGRpTTVzcWsvWVpobk5mWE00MGJ2a2ZHOTllTTZI?=
 =?utf-8?B?QlVjeWY3SUlQelRCeWwrTDlnM3Vmam5rQ1pJTU5HenNwSXQ4dVdvV0dnSDFZ?=
 =?utf-8?B?WXc0dnRZdXlSWkw2NEtLcjMrZ3hUK0ZqaWhjcmZlenBTNE5lSHZkTy9nMlRG?=
 =?utf-8?B?Z0N1R1llOGtwcWI0RmpndWRjcGpqRW41eHJ2c3pwVThOb1VTdE15czhDOXJN?=
 =?utf-8?B?K0VHYnE4bmJ4SkJjTnFqeE1HSmZISDJYeUpwdE83QUdKeXVsQk5CQkdpaWIx?=
 =?utf-8?B?ZGNkT3ZWL1NKTWNFWHpVZVdOaTRFUFVIUUs4N0NLZEsyeVd0RkljY2VySzdh?=
 =?utf-8?B?Y2ZCVUsxQzRla2JNZEwwamZRZTRGcjhpUzJRSUo4dHh4clM1aHRyM1dYcUhS?=
 =?utf-8?B?cTFLR3JSVHhpSFp3emRSaFBYRlpYdWFzaW5tUGdtc3VheHUxMEhDNnU4MlN0?=
 =?utf-8?B?YmM2MWtlV01CVUpMcHlqWE0wWVd1WnVRdjA0NFkybnJnK1ZZQk1KMkJ0K0w4?=
 =?utf-8?B?dktFd2dzb1NLWFlMdXRycENiZSttaWRYdWZ3TEtFVW8yM0JrVE1zbzVhTk5x?=
 =?utf-8?B?UDRoUjMyUWJZZlErblRUYWlUZmErd2NpMHlZL3ZlSi83TVFLYmFYc21ZV2Qx?=
 =?utf-8?B?V0psK2RDelVlcXBqUktKTmR3NVNIdTZsOTAwK3F4TWJzZ0J6VjREMFh2eGtz?=
 =?utf-8?B?WUF3SmxvcWNPVU5FRno2RWh4TjlrMGZKeS9OYlZSSDl2UkJ2eE84a0E5TFZV?=
 =?utf-8?B?d3ltcjJua1RKT0FjeUtPWVJhM2l6VUNPNUU0YjRjd1dmcEJLL25KT3NjYnds?=
 =?utf-8?B?MkE2VlRRcTJFNmpVSVpwNTdNWHpTSU5CMTUybm45ZUptODg5dnRVZlFUV2ow?=
 =?utf-8?B?UGxpeForM1UzeWI5OGVsMlFSTFRBbmhkYTJVNWhTU1MrK0FnZmsrTnJpdThx?=
 =?utf-8?B?VmpBclhhaHhMcXpNdjhZRHRXeHo1THhDcnVEcjBDRUVieFN5ck5lSDRCZldi?=
 =?utf-8?B?ME9YNGxCeUp2MmwwRWlvVFltRGhaNVVOVXpUZ0tQeVphSDh5ZnRvOE1CeTR5?=
 =?utf-8?B?V0MwNlNLcUJZdXpuY21UV0hvV0ZNRkdycE1GOTJZWGZGTjZPYjVkajB1VUg3?=
 =?utf-8?B?VmZ1M1R0R2tqTjVDUi9RemF4OWZjUHdXakxWcmxpL0NBbFJ5ZzF2Q3NFRUxj?=
 =?utf-8?B?OWdRUi93WHJZQ2gwOG43eEVpemVqR0hPQjR4VXlxdnNENE90Qm9hVXR5Skpo?=
 =?utf-8?B?dGdyb2pDWHlFMFhhV1ROeWZxd05pbWMwM3BvZEszQTU3S3B4VkV3VGM5YXdX?=
 =?utf-8?B?ekRUdSt4L2xnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWFmQ1JJcFJ2Zi9RQzNNSmFYdWhGMzlWV1ovOVR0azNUemxzRFBIMTJWL3ZT?=
 =?utf-8?B?THgrbWFyWGQyRVFVeG43TmNDRlZKTEZxUVc4L0JQYnkybGVFQVJkWkRUaSth?=
 =?utf-8?B?dXR6cXg3MmZ2ZlZCOGlialFzQ2lYTVlYOENROGtvbG5zT004TEhxb1E2a1A1?=
 =?utf-8?B?RGwwQkovNHdOakFvTGhTN29VWU5PZ05sVDk3NVlldUhWTXd6UHpEWnhCWjF5?=
 =?utf-8?B?Y2o5dW1USjVUelhFU0VHd3FJNGpWaHk5dExGalVXQUtvdldPcC9pWnVOTlJs?=
 =?utf-8?B?T01OYVJ5VmJJUzhvVW5aN0VoSFE2NDVadDZ5ckRMWjlpRjhQUXNSQ1REZHpW?=
 =?utf-8?B?U0J1K3RReS9PSHBmWnN4Z1dVYXdpR1MzWHFBV0FjVDFpSHoyY1UybnNyNHgv?=
 =?utf-8?B?RDhxYkxGYXFUS1dtbFZNUGp5alhUUEZhWjNPQ3FmbkFUL1JxWUtUME1DWWR3?=
 =?utf-8?B?WGdOQWZpU3JKQ3JUTFVxcVMwalpic1hhMkREay9zaXlQOWVMZVhhNTJMbWR1?=
 =?utf-8?B?L2gzVFU2NzVYSFgvZkR4UDlKSElyZWptTWU4UElZMU4wYlJBM0w0WjJ3Rzk4?=
 =?utf-8?B?MitxNEZZWDFhcnFkMGd3eHZJallwcmhUWFVGWjBWMzRLT21jdW9OTVQwNVRO?=
 =?utf-8?B?bUJmNUZYaDFCM3dVYVBPVFpPOXh3QUtacjRxN1MxTjFPam9IeEdtVnVLa1Jt?=
 =?utf-8?B?dktudXkvMUxyY2V6TzdHck9iZUJXS2tOMjRmMnpRbUdjaC9sYkpnbTU0eTNF?=
 =?utf-8?B?NjNCdVpFWjZSbHVOcUsrTUdIekNMS1MyOUN4OWpsa0Voak4xZmZib21xV3l5?=
 =?utf-8?B?UGpsRVI1R1YrVjV6UG9IS1JqSjdKc2xudGZpbHorUTNzVnRVQ2tsT203MGlQ?=
 =?utf-8?B?b1JCZndpSE9ON0RiWURxUXROQktMSWFQODJIcm5OS05JWDg3ZTFtWGxOZVFx?=
 =?utf-8?B?a2xzc00zOFRqV0tPYVJDN0JOWHpBYjdWZ3RvanE5NHVkZVFaMFplTUlzK2R3?=
 =?utf-8?B?d0hCZTh4b0Q5a2NFQW9SOXM2UnUydkg4Vk9CQm8rUFNHRXVDZFBZMzU2MVlD?=
 =?utf-8?B?RjBHR0ExSTV6VHJnYTdkOHJCWGJtUEkxaTd6RHNFMU50clY5VDQvcDlBcEVj?=
 =?utf-8?B?ck5IS0NIOVJPeWZZOXRwV0RvdVEzQ2lGSGcxaHQ0OHZyUGExNHJCdS9yd3hD?=
 =?utf-8?B?Y2lxa0JBR24vekU3UkQrcWRnVW45dWNzdVNnWWg3WnFJRUU4YTViVFZ5dGYv?=
 =?utf-8?B?WEdiMFBvOSt6WUo2bWNzZDcyNGZrUFhGRDNJMnU2ZHFUcGpGNG16WUN6VVl1?=
 =?utf-8?B?VUJBUkdBL1VWa1lKd3VTU2RSYzFIMjUvK0ptdFFHYkNRZkk4Z0dEQ29zT1hq?=
 =?utf-8?B?WUFZVWoveG9CR3c0TXBFdnRtZDZ5dEZtbWRhczFQR1drOWt3OUdQSWtrNlgv?=
 =?utf-8?B?NWw3MnlkNEZ5Nnl6WjYzek82YzlIclNZMUNxam9FdlFkMjlrY3dhem9yNDVs?=
 =?utf-8?B?MXpYNWdzMVZSZFIzbW1pNElHQjVNOGJZMTcwQU0vRG55S01LSUFpSnZmL3Bn?=
 =?utf-8?B?MklKbW1Zb1A3ZDRaYXJ3NkR0VGs0cWhMVlE2dllSbXVFQUExNVYva2toOCsz?=
 =?utf-8?B?TDgrcUdaKzhEMzdLWGhJd0w1ZFl6blZOT2dvYTNRcDVVVkZiRTNSVThGZHlH?=
 =?utf-8?B?UjNLd2xXdTB4RDFPUU1FM1o2Q3NKTCtlcldZREg2TDRPZSs2MkRDWWJrMGdv?=
 =?utf-8?B?Y1dBZjlxYys4d2F3SmtXUU5RMFkrcytBNEdLdm1XRnhwUnFnakxwZXpOS0x0?=
 =?utf-8?B?UGttZEtjc0hzU0VodG5ZV2V4MjdPM2hOeE5ERjZ5SkhlbGZaR29QYkJia09t?=
 =?utf-8?B?WmhiMmdkWHdxUVNPOGhkVG5SN2tpOVhoS2YwNWE1S1VYSVIvckxUY2QweE9r?=
 =?utf-8?B?eENHN1lvOE50dDJ1c29ySmFnenN1aHo4ZTkya0ZqNU1BK2JkU2N6Q0xML2M1?=
 =?utf-8?B?Y1Y4YVhoVUpPcFVyMkl0YjduSEtSRDRxTDlPTFU1Y1NrdTE5RDJ1SmxiRFZQ?=
 =?utf-8?B?Z2RiTjNFMzcrVWM1Rld5cVJka3lhNEFWY2RYa3ZVN09YNDBObTl4RUhiVUor?=
 =?utf-8?Q?OpUc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de3bdec-3a5b-4310-0761-08dd87d55772
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 10:54:12.1216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n52Krr+clwbwpDg8kbnx5e3K3IdEqySOwOENJMWuYfY2HKV+sBLK5Q8YPdacowLvnm7caMxszupbI9/5fQoE9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390

DQoNCj4gRnJvbTogUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIEFwcmlsIDMwLCAyMDI1IDM6NDIgUE0NCj4gDQo+IE9uIDQvMzAvMjUgNjo0NCBBTSwg
UGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+PiBGcm9tOiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEBy
ZWRoYXQuY29tPg0KPiA+PiBTZW50OiBXZWRuZXNkYXksIEFwcmlsIDMwLCAyMDI1IDI6MTQgQU0N
Cj4gPj4NCj4gPj4gT24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgMTA6Mzk6NTlBTSArMDIwMCwgUGFv
bG8gQWJlbmkgd3JvdGU6DQo+ID4+PiBPbiA0LzIzLzI1IDg6MDcgUE0sIE1pY2hhZWwgUy4gVHNp
cmtpbiB3cm90ZToNCj4gPj4+PiBPbiBXZWQsIEFwciAyMywgMjAyNSBhdCAwOToyOToxMUFNIC0w
NzAwLCBEYW5pZWwgVmVya2FtcCB3cm90ZToNCj4gPj4+Pj4gT24gVHVlLCBBcHIgMjIsIDIwMjUg
YXQgMTA6NDbigK9QTSBNaWNoYWVsIFMuIFRzaXJraW4NCj4gPj4+Pj4gPG1zdEByZWRoYXQuY29t
Pg0KPiA+PiB3cm90ZToNCj4gPj4+Pj4+IEknbSBhZnJhaWQgd2UnbGwgaGF2ZSB0byBiaXRlIHRo
ZSBidWxsZXQuDQo+ID4+Pj4+DQo+ID4+Pj4+IE9uZSBvdGhlciBpc3N1ZSB3aXRoIGJpdHMgPiA2
MyBpcyB0aGF0IHRoZSB2aG9zdC11c2VyIHByb3RvY29sDQo+ID4+Pj4+IFZIT1NUX1VTRVJfR0VU
X0ZFQVRVUkVTIGFuZCBWSE9TVF9VU0VSX1NFVF9GRUFUVVJFUw0KPiA+PiBtZXNzYWdlcyB1c2UN
Cj4gPj4+Pj4gdTY0IHRvIHJlcHJlc2VudCB0aGUgZmVhdHVyZXMsIHNvIHZob3N0LXVzZXItbmV0
IGRldmljZXMgY2FuJ3QNCj4gPj4+Pj4gcXVlcnkgb3IgZW5hYmxlIHRoZXNlIGZlYXR1cmVzLiB2
aG9zdC11c2VyIGlzIG91dHNpZGUgdGhlIHNjb3BlIG9mDQo+ID4+Pj4+IHRoZSB2aXJ0aW8gc3Bl
YywgdGhvdWdoLCBhbmQgSSB0aGluayBpdCdzIHJlYXNvbmFibGUgdG8gZXh0ZW5kIHRoZQ0KPiA+
Pj4+PiBwcm90b2NvbCB0byBlbmFibGUgaGlnaCBmZWF0dXJlIGJpdHMgcmF0aGVyIHRoYW4gYXZv
aWRpbmcgdGhlbSBmb3JldmVyLg0KPiA+Pj4+DQo+ID4+Pj4gWWVzIHlvdSB3b3VsZCB1c2UgVkhP
U1RfVVNFUl9TRVRfUFJPVE9DT0xfRkVBVFVSRVMgdG8gbWFrZQ0KPiA+Pj4+IFZIT1NUX1VTRVJf
R0VUX0ZFQVRVUkVTIHJldHVybiB0d28gdTY0cywgb3IgZXZlbiBhIG5ldyBtZXNzYWdlDQo+ID4+
IHJldHVybmluZyBhbiBhcnJheS4NCj4gPj4+DQo+ID4+PiBJIHRoaW5rIHRoYXQgYWRkaXRpb25h
bGx5IHRoZSBWSVJUSU9fTkVUX0NUUkxfR1VFU1RfT0ZGTE9BRFNfU0VUDQo+ID4+PiBjb21tYW5k
IHdpbGwgbmVlZCBzb21lIGNsYXJpZmljYXRpb24sIGFzIGluIHRoZSBjdXJyZW50IHRleHQgbG9v
a3MgYQ0KPiA+Pj4gYml0DQo+ID4+PiBpbmNvbnNpc3RlbnQ6DQo+ID4+Pg0KPiA+Pj4gIiIiDQo+
ID4+PiAvLyBpbiBPZmZsb2FkcyBTdGF0ZSBDb25maWd1cmF0aW9uIC8gU2V0dGluZyBPZmZsb2Fk
cyBTdGF0ZToNCj4gPj4+DQo+ID4+PiAjZGVmaW5lIFZJUlRJT19ORVRfRl9HVUVTVF9VRFBfVFVO
TkVMX0dTTyAgNDYNCj4gPj4+DQo+ID4+PiAvLyAuLi4NCj4gPj4+DQo+ID4+PiBUaGUgY2xhc3Mg
VklSVElPX05FVF9DVFJMX0dVRVNUX09GRkxPQURTIGhhcyBvbmUgY29tbWFuZDoNCj4gPj4+IFZJ
UlRJT19ORVRfQ1RSTF9HVUVTVF9PRkZMT0FEU19TRVQgYXBwbGllcyB0aGUgbmV3IG9mZmxvYWRz
DQo+ID4+IGNvbmZpZ3VyYXRpb24uDQo+ID4+Pg0KPiA+Pj4gbGU2NCB2YWx1ZSBwYXNzZWQgYXMg
Y29tbWFuZCBkYXRhIGlzIGEgYml0bWFzaywgYml0cyBzZXQgZGVmaW5lDQo+ID4+PiBvZmZsb2Fk
cyB0byBiZSBlbmFibGVkLCBiaXRzIGNsZWFyZWQgLSBvZmZsb2FkcyB0byBiZSBkaXNhYmxlZC4N
Cj4gPj4+DQo+ID4+PiBUaGVyZSBpcyBhIGNvcnJlc3BvbmRpbmcgZGV2aWNlIGZlYXR1cmUgZm9y
IGVhY2ggb2ZmbG9hZC4gVXBvbg0KPiA+Pj4gZmVhdHVyZSBuZWdvdGlhdGlvbiBjb3JyZXNwb25k
aW5nIG9mZmxvYWQgZ2V0cyBlbmFibGVkIHRvIHByZXNlcnZlDQo+ID4+PiBiYWNrd2FyZCBjb21w
YXRpYmlsaXR5ICIiIg0KPiA+Pj4NCj4gPj4+IFRoZSAiY29ycmVzcG9uZGluZyBkZXZpY2UgZmVh
dHVyZSIgaGFzIHRoZSBzYW1lIG51bWVyaWNhbCB2YWx1ZSBvZg0KPiA+Pj4gdGhlIHNlbGVjdGVk
IG9mZmxvYWRzLCBleGNlcHQgZm9yIFVEUCB0dW5uZWxzIHJlbGF0ZWQgb25lICh3aGljaCBhcmUN
Cj4gPj4+IG1hcHBlZCB0byBiaXRzIGNvcnJlc3BvbmRpbmcgdG8gcmVzZXJ2ZWQgZmVhdHVyZXMp
Lg0KPiA+Pj4NCj4gPj4+IEl0J3MgdW5jbGVhciB0byBtZSB3aGljaCBzaG91bGQgYmUgdGhlIGJl
dHRlciB3YXkgdG8gYWRkcmVzcyB0aGlzDQo+ID4+PiBpbmNvbnNpc3RlbmN5Lg0KPiA+Pj4NCj4g
Pj4+IC9QDQo+ID4+DQo+ID4+DQo+ID4+IFBhcmF2LCB3aGF0J3MgeW91ciB0YWtlIGhlcmU/IEdp
dmVuIHlvdXIgY2hhbmdlIGJyb2tlDQo+ID4+IFZJUlRJT19ORVRfQ1RSTF9HVUVTVF9PRkZMT0FE
U19TRVQsIGRvIHlvdSB3YW50IHRvIHJldmVydCBpdD8NCj4gPg0KPiA+IEkgc2VlIHR3byBvcHRp
b25zLg0KPiA+IE9wdF8xOg0KPiA+IE9wZW4gc291cmNlIExpbnV4IGtlcm5lbCBkcml2ZXIgYW5k
IERQREsgUE1EIGhhcyBub3QgdXNlZCBSU1NfQ09OVEVYVA0KPiB5ZXQuDQo+ID4gSWYgSGVuZyBm
cm9tIEFsaWJhYmEgYWNrcyB0aGF0IHRoZXkgZG8gbm90IGhhdmUgYW55IGludGVybmFsDQo+IGlt
cGxlbWVudGF0aW9uIGVpdGhlciwgaXQgbWF5IGJlIHNhZmUgdG8gc2hpZnQgX2FsbF8gZmVhdHVy
ZSA+IDYzIHRvIGxvd2VyDQo+IHBvc2l0aW9uLg0KPiA+IFdlIGNhbiBnZXQgWXVyaSdzIGZlZWRi
YWNrLCBpZiBhdCBhbGwgd2luZG93cyBkcml2ZXIgaGFzIHVzZWQgUlNTIGNvbnRleHQuDQo+ID4N
Cj4gPiBBbmQgb25jZSBmb3IgYWxsIHdlIG1hcmsgaXQgdGhhdCBmZWF0dXJlIGJpdHMgYXJlIGxp
bWl0ZWQgdG8gMC02My4NCj4gPiBUaGVyZSBpcyBlbm91Z2ggaW5mcmFzdHJ1Y3R1cmUgaW4gcGxh
Y2UgaW4gdmlydGlvIHNwZWMgdG8gbm90IHRyeSB0byBzcXVlZXplDQo+IHRoaW5ncyBpbiBmZWF0
dXJlIGJpdHMuDQo+ID4gQW5kIHRoZXNlIDQgYml0cyBhcmUgZ29vZCBleGFtcGxlIG9mIGl0IGFs
cmVhZHksIHdoaWNoIGNvdWxkIGhhdmUgYmVlbg0KPiBuZWdvdGlhdGVkL2NvbW11bmljYXRlZCBh
dCBsYXRlciBwaGFzZSBvZiBkcml2ZXIgYXQgcnVudGltZS4NCj4gPiBPbmx5IGJpdCByZXF1aXJl
ZCB3YXMgYSBiaXQgdG8gZXhwYW5kIHZuZXQgaGVhZGVyIHNpemUgYXQgZWFybHkgc3RhZ2UuDQo+
ID4NCj4gPiBBZHZhbnRhZ2U6IGJyaW5ncyB0aGUgZ29vZCBwcmFjdGljZSB0byBhZGFwdCB0byB0
aGUgbW9kZXJuIGFuZCBlZmZpY2llbnQNCj4gZHJpdmVyLT5kZXZpY2UgaW50ZXJmYWNlLg0KPiA+
IFJpc2s6IE1heSBicmVhayBSU1NfQ09OVEVYVCAocmlzayBsb29rcyBsb3cpDQo+ID4NCj4gPiBP
cHRfMi4gVklSVElPX05FVF9DVFJMX0dVRVNUX09GRkxPQURTIGNvbW1hbmQgdGV4dCB0byBiZSB1
cGRhdGVkDQo+IHRvDQo+ID4gaW5kaWNhdGUgdGhhdCwNCj4gPg0KPiA+IEJlbG93IGRlZmluZXMg
Y29ycmVzcG9uZHMgdG8gcmVzcGVjdGl2ZSBmZWF0dXJlIGJpdHMgNjUgdG8gNjguIFRoZXJlIGlz
IHN0aWxsDQo+IG9uZSB0byBvbmUgbWFwcGluZywgaXRzIGp1c3QgcG9zaXRpb24gaXMgZGlmZmVy
ZW50IGluc2lkZSB0aGUgY2xhc3MuDQo+ID4gVGhpcyBpcyBjbGFyaWZpY2F0aW9uIHRleHQgdG8g
YmUgYWRkZWQgYW5kIHN3IGNhbiBhZGp1c3QgZm9yIGl0Lg0KPiA+DQo+ID4gI2RlZmluZSBWSVJU
SU9fTkVUX0ZfR1VFU1RfVURQX1RVTk5FTF9HU08gNDYgI2RlZmluZQ0KPiA+IFZJUlRJT19ORVRf
Rl9HVUVTVF9VRFBfVFVOTkVMX0dTT19DU1VNIDQ3ICNkZWZpbmUNCj4gPiBWSVJUSU9fTkVUX0Zf
R1VFU1RfVVNPNCA1NCAjZGVmaW5lIFZJUlRJT19ORVRfRl9HVUVTVF9VU082IDU1DQo+ID4NCj4g
PiBBZHZhbnRhZ2VzIG9mIDJuZCBvcHRpb24gYXJlOg0KPiA+IGEuIGZlYXR1cmluZyBiaXRzIHJl
bWFpbiBvcGVuIHVwdG8gMTI3Lg0KPiA+IGIuIERvZXMgbm90IGJyZWFrIFJTU19DT05URVhULg0K
PiA+DQo+ID4gQm90aCBvcHRpb25zIGFyZSBwcmFjdGljYWwgdG8gbWUuDQo+ID4gSSBwcmVmZXIg
IzEsIGlmIEhlbmcgYWNrcyBpdCwgYnV0IGFsc28gb2sgZm9yICMyLg0KPiANCj4gSSBzcGVudCBx
dWl0ZSBvZiBiaXQgb2YgdGltZSB0cnlpbmcgdG8gZXZhbHVhdGUgdGhlIHNjb3BlIG9mIGZlYXR1
cmVzIGJpdA0KPiBleHBhbnNpb24gKGltcGxpZWQgYnkgdGhlIG9wdGlvbiAyIGFib3ZlKS4NCj4g
DQo+IFdoaWxlIHN0cmljdGx5IHNwZWFraW5nIEkgaGF2ZW4ndCBoaXQgeWV0IGEgY29tcGxldGUg
YmxvY2tlciwgaW1wbGVtZW50YXRpb24tDQo+IHdpc2UgaXQncyBnb2luZyB0byBiZSBodWdlIGFu
ZCBlcnJvciBwcm9uZSwgYXMgZ3JlYXQgZGVhbCBvZiBib3RoIHRoZSBrZXJuZWwNCj4gYW5kIHRo
ZSB1c2VyLXNwYWNlL3FlbXUgaW5mcmFzdHJ1Y3R1cmUgaGFyZC1jb2RlcyB0aGUNCj4gNjQgYml0
IGxpbWl0Lg0KPiANCj4gRXZlbiBleHBvc2luZyB0aGUgZmVhdHVyZSBleHRlbnNpb25zIG9ubHkg
dGhlIHRoZSB2aXJ0aW8tbmV0IGRldmljZSAoQUZBSUNTIGl0DQo+IHdpbGwgIm1pbmltaXplIiB0
aGUgY29kZSBjaHVybikgYSBsb3Qgb2YgY29kZSBhbmQgZGV2aWNlcyBpbXBsZW1lbnRhdGlvbnMg
YXJlDQo+IGdvaW5nIHRvIGJlIGltcGFjdGVkLg0KPiANCj4gSSBleHBlY3QgYSBmYXIgYXdheSBp
biB0aW1lIHRpbWVsaW5lIGZvciBpbXBsZW1lbnRhdGlvbnMgYmFzZWQgb24gb3B0aW9uIDIuDQo+
IA0KPiAvUA0KR2l2ZW4gdGhhdCBpdHMgcGFpbmZ1bCBlbm91Z2gsIHdlIGNhbiB1cGRhdGUgdGhl
IHZpcnRpbyBzcGVjIHRvIGxpbWl0IHRvIDY0LWJpdCBmZWF0dXJlcyBhcyBvcHRpb25fMS4NCg0K
QSB2aXJ0aW8gc3BlYyBkaWZmIGxpa2UgYmVsb3csDQotIDAgdG8gMjMsIGFuZCA1MCB0byAxMjcg
RmVhdHVyZSBiaXRzIGZvciB0aGUgc3BlY2lmaWMgZGV2aWNlIHR5cGUNCisgMCB0byAyMywgYW5k
IDUwIHRvIDYzIEZlYXR1cmUgYml0cyBmb3IgdGhlIHNwZWNpZmljIGRldmljZSB0eXBlDQoNCk90
aGVyd2lzZSwgd2UgYXJlIGRlbGF5aW5nIHRoZSBwcm9ibGVtIHRvIG5leHQgZmVhdHVyZSwgd2hp
Y2ggaXMgbm90IGdvb2QuDQoNCkhlbmcsDQpZdXJpIGFscmVhZHkgYWNrZWQsIHNvIHdlIGFyZSBn
b29kIGZyb20gV2luZG93cyBzaWRlLg0KV2l0aCB0aGF0IFdpbmRvd3MsIExpbnV4IGtlcm5lbCwg
RFBESyBQTUQgYXJlIHNhZmUuDQoNCkNhbiB5b3UgYWxzbyBwbGVhc2UgY29uZmlybSB0aGF0IHRo
ZXJlIGFyZSBubyB1c2VycyB3aXRoaW4gQWxpYmFiYSByZWx5aW5nIG9uIFJTU19DT05URVhULCBz
byB0aGF0IHNoaWZ0aW5nIHRoZSBmZWF0dXJlIGJpdCB3aWxsIG5vdCBicmVhayBhbnkgZXhpc3Rp
bmcgZnVuY3Rpb25hbGl0eT8NCkkgdGhpbmsgaXQgd2lsbCBub3QgYnJlYWssIGJlY2F1c2Ugd2Ug
Y2FuIHVwZGF0ZSB0aGUgbm9uLW9wZW4tc291cmNlIHNvZnR3YXJlIHRvIGRldGVjdCBSU1NfQ09O
VEVYVCBvbiBhIG5ldyBiaXQuDQoNCkZvciBleGFtcGxlLCBkcml2ZXIgY2FuIGRvLA0KRW5hYmxl
X3Jzc19jb250ZXh0IGlmIGJpdCBYIE9SIEJpdCA2NCBpcyBzZXQuDQo=
