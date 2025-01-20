Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D70B199EB7
	for <virtio-comment@lists.linux.dev>; Mon, 20 Jan 2025 08:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363458; cv=fail; b=SBxCltZu2QccWADw08i5F09HU9sKH3ZUq8FZES6ImqjMBVWywNLFJqOd8r9sfUtNY33mgbIxRVIM4V3N4Y41Rs+cuwryLA+y7F705creT0msbz0Xn3D3AMjVe7AnysrI7wh4tDXR0/z8Bv0xiKub3QW30AbFVa2CrpZgO/dQ8bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363458; c=relaxed/simple;
	bh=z4aglP7jC+q8YyIYb9iy2qnCQBcN0Z+Goskz6pgV+8U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j/7YjdvoiYsPfTQnLr8Ae9YyEdVmiXqXP1JwbwpoU24RSKUVsWLxhqvapBHbyYkjOXdyRpc3qvQwhUERU6CeirCnhpDQaxIV8GUgaXyjS1Sfub3ypb82uio1Gm842lcKV/2NB4Fz5HZLn03+3EXiFiK8q1h/0Q5T1mLf9liRqBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r+UYUa7f; arc=fail smtp.client-ip=40.107.94.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r+UYUa7f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0tP6U6H5hREMKXRNg7uBljMzsZ0eeW+pfg9/KuF4zqyRPlW0WpLwkWNOwKDMbG2psW4+n8Tt2tRiDlckh+/lOKefX0ifegVU2EoExD7R6q0biWDlsUwn/03zfTpvd7Mgkiovjt6FLZB9aQXE2g/ZrFSqTdFhAKJo5pp7Le3etV34fWniSw83l0s/djK00gPDzeXtAYpyuwVxm9JPqKwQG0T6hJAyllF4RvyjFopkiKGeVmY+uRfv3kL5yuUQ1orKeF7y+d23nQYx8WB7U/+FWSdOL7pGSHENHGW+nTRx9mUwesmpp1MmJ8DMXuGhKf2/wK1t2DHRjJAlG2JgQ3cnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4aglP7jC+q8YyIYb9iy2qnCQBcN0Z+Goskz6pgV+8U=;
 b=TpJpupyISUQSnwwPyzs0CklZ4CLhAaBiQEgiirZTvGwZGf7wYTK5pjWt1gmjNXhRBHgJLhZFAOatHdK/NoVY/kkwK2RrObPCkJlzFFjiuGQ//2ztp0LMBr78/dOVojdDTm8/xGgZ/iXe0c/QR5MmpuUn7wGFW2QnHVU7ZllHiPFtNz1BpZAjIX6JNJlnTqr/eFpN8Kv9HsnpOshk6g3r1tTcUOgjKpM83Secwf9+eMy0RKfhulVkzHDxEqXcEd/nw7g5VGjYSP8vkoF5z+sn0B+DHyzqaBhRBKOr1yBYMhlufL5XOMUp51LgKPGRz4ByT3EQibpS2mdoL5kpQTSz0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4aglP7jC+q8YyIYb9iy2qnCQBcN0Z+Goskz6pgV+8U=;
 b=r+UYUa7fvbtsROugTCq2kAJyowZmZ9u/UfSuw2G8I34bqA3RD1ta4CTRQZIKS8uIg011Z6voly/5LJ1pswFMVjE6WQ9QDOERJHceC6WEH/fuvWKZ0QKHrntcrd8iwBIkI7nh8ErUJVCy/O+PWfQ1ZmbHZLcCTo2Jcgcc14r2hUAmXrFRwWNKtZm//fB4cK/YdexThtZ+lBjzLvncy6aITu15uFIKHZZus40sQ/YaQtaC/ZVj1vDHSzG1dwLLvhkABP2s7gFp0RyOjn1GIa/qDF7/5SctWNRG9p2uczmOXq4X0oc1XN3v1Do+0C3G6iTqEm9clmEUk3J8AJgWklcV2A==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS0PR12MB9424.namprd12.prod.outlook.com (2603:10b6:8:1b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 08:57:34 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8356.017; Mon, 20 Jan 2025
 08:57:34 +0000
From: Parav Pandit <parav@nvidia.com>
To: Paolo Abeni <pabeni@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, Eelco Chaudron
	<echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, Stefano Garzarella
	<sgarzare@redhat.com>, Willem de Bruijn <willemb@google.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
Thread-Topic: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
Thread-Index: AQHbQK/3KR1RJyc06Uq86qDUg7CIZbMeDhsAgAGfkICAAAMOkA==
Date: Mon, 20 Jan 2025 08:57:34 +0000
Message-ID:
 <CY8PR12MB7195B094CE8C2DEF2EE5ECD3DCE72@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <cover.1732699986.git.pabeni@redhat.com>
 <3e1c45071c8cf4efc7ca0ecc7b52a73c6bf983fe.1732699986.git.pabeni@redhat.com>
 <CY8PR12MB7195D914B9EF00FF62C5E1DFDCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
 <81a73808-74b0-4663-8811-d8b9e7016b38@redhat.com>
In-Reply-To: <81a73808-74b0-4663-8811-d8b9e7016b38@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS0PR12MB9424:EE_
x-ms-office365-filtering-correlation-id: 99ea65fa-23b2-4ea6-9d08-08dd39307b3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cTA0YU1rYW1LeG9sb1BpckFuQXRNQW45UmV3RDBwZ1Q5dEtiVnlzTGdoem8r?=
 =?utf-8?B?S2Y4eERmaGlQQU9UamlHOEFnVVh4c2lqaVlDV1BRZE9FK2VvZzdUSlNoSkNL?=
 =?utf-8?B?QlphTktBdzBWK3ZscVZuY2JZOTI5dlF2RmdBajlFNElzeWdnSjc0U2xNZlZH?=
 =?utf-8?B?ay8yZXVmaWwrTlE5cjJJSEJjVVI0VTlkQWpndFdLajlZTllNUUpqK0YrWWta?=
 =?utf-8?B?c0VNZzhWckZ5aHVGaklSYjQ3UWNEbTFlcnNGZkhHQXFESGJ6K0tUYUcwSW1l?=
 =?utf-8?B?eXhlSnhQSUlRNXFqd0NJSjFPMnA0UXdjZVZILzV3N20vQjFuc0dJWmFrOFV5?=
 =?utf-8?B?MUdHRmF5c1dnSmszZnprU0kweGpXMHhhc0J2Z3o1T2JGMVcvU0o5cTQwNUUy?=
 =?utf-8?B?anYySGNRVWl4RnFuY2ZLUUJXUTRNMUcvT2JrWk4rNWJqM1JaWDdPMDNCaXhn?=
 =?utf-8?B?TTdHV08zN2MrdDdsejZSWjlMWkVySDl6NnZ3Uk1WNVh0Q1VrVGZWaTVycnJC?=
 =?utf-8?B?RHptbndtNXpxdnJwc01kUjBkTVBNVFRlNUxSdGdFWnJDZUR1Nmt0VjJjbko3?=
 =?utf-8?B?R2RqZWdyVmZiZUZxNW5iNFR6VUswVWtVMzQ4ZTMwaVU3T1dHWm9qTllzV0xL?=
 =?utf-8?B?ZXhPWXdEamRQZVg3U0pTTFNGUFczNkpsWWZvUVdyRWk2WkdIMGtDcmg4WjVo?=
 =?utf-8?B?c0hRVjUzYVdJSVhDckVGTDgzTTlPd0xLN2tPYWVLL3hJdnpmUW93MFlqMTVy?=
 =?utf-8?B?RW80aDBLZkp0UTRrNXJjQ2h6YjFYSkUxL0VMam8zWGVRZys0MUlOcncxcWMv?=
 =?utf-8?B?M3dNWU1wT2tRSzJlUlBLbHU1elo3bk5EYllheWFSakc3SW5CL3BwdzE3T01M?=
 =?utf-8?B?cUl1OTRKejEzdXp1MC8zMEI4ZmxPQW10NVRWZ3k0UGZWMTZxQlZjLy9GRy9O?=
 =?utf-8?B?UmdNbFdGTCs0S1huY2VtWGdITVMxN3BwRVBJSWVkQVZQckE5QjBZR05hODZJ?=
 =?utf-8?B?SzBEQUFGQkoxVFo0bTYwTXZrUHBrQWRvWSsrejExT3BIUFRDQTk1YTU2bjl0?=
 =?utf-8?B?bW5VcmRaSjZmdmFFU2R1cmFBV1BpMUtWSFV3bWFFWUVRUXpsbkloZXBBK3ox?=
 =?utf-8?B?V2hHUWRHY2MzNUMybG56OTdUdHNpYVd1RXFBdi9GcHlzK3B4TE1reTNEQmta?=
 =?utf-8?B?Z0lEVGhKVlMzWXVrRmwzK2dPZW1wc3RKVFRBNGUvbDMrSklOS3JuRFpjdHZG?=
 =?utf-8?B?aFVQdTcvYktKUmQxZ1pWK1lqUWFsVzFza3ZWYTl5NHJSZWtYSmFObVNOeXds?=
 =?utf-8?B?NCtWSXY2cWNWRjQzSGRJdFJOTTNFWGJuOVV0UWphZ2NWejd1WSt4aHRGc0hZ?=
 =?utf-8?B?NTJYRE96UE5RbzZjSFlJSnpDTHJXWWpISU91RitBZENuWlBKOFVmU25KUVFn?=
 =?utf-8?B?R3pqdVFyUlVYN2s3eS9CUzJUSTR5WmVUYXNPa2xCdXhUa1VtS21QWTdWOE1s?=
 =?utf-8?B?azNCdUdOQ05SZ1oyWjlnYkVabVAyaXYyMnF4bVVONWpWZ1doRjJJOG1LVzRw?=
 =?utf-8?B?c1N0K3crUU9MSTR1VkpacmpPekJUcFJOL3NXQnNqdVNnb2x5Sk1takZjdm9K?=
 =?utf-8?B?cTlHKyt6djVuSjJKaEMyL2tQcWtySEZmdHc3dk5ETUNvMUErdGVJMjJtbVdh?=
 =?utf-8?B?R2xaNGhEWjgrclkzUDlQU3hKeTNZT08wNDNMT21nd1hXZ2ZNNld5ZCtOSUxR?=
 =?utf-8?B?MHVIOGZQekU1TzJFZ2FUU1ZzYXkvajNucXFXU3c4VHJ0UGZYSnlhTkNlM3RS?=
 =?utf-8?B?VnpxZXhhb2NPcmV0RmVlazlaa05zYmgrYlVKYUxaNFJBME9FL1dqVzZaK2tJ?=
 =?utf-8?B?WGVMZWNUS2U0cFFSZTZEbEZPU0N6Zm9CRkNQQWlFMlBpUUF4WGNra1pHc1ZV?=
 =?utf-8?Q?onk9sJhMM7fpyn4PPt0LISVURtbrshp6?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NXdzTkxzbU11N3IrdEN0bFA4M2NJQ1lLVHZ4YUdXNklGTkdKRk9MNGw4MTJO?=
 =?utf-8?B?dnhIaDBlemJkb1NLcEZiaklBOHVGaFRmWVZlbURrV3ZSZTkvMmN2bW90dHll?=
 =?utf-8?B?YlAySko5d0RLcnRuWDFzUFZvREc0bnA2V0EzY2ZiV09sUzN2MXcyY2g4anUv?=
 =?utf-8?B?TGYxT3lhclo0L0VLZCtKWS9KWWRRMXd3MlZ1ZjAyc2lKMHcxTDFxMTU2dnJH?=
 =?utf-8?B?bmd6WEpEczhrbnBiMlVrYXRsOFBpSnlBRnR5YXB3YUdiRWt6MW8vQTQ1c0Va?=
 =?utf-8?B?aDUxM0lCaXJKZnVmRm5TWVpUakhhOHoyWnR1bEtmdk9BZ21ocG9tNlR4TjRP?=
 =?utf-8?B?MysvaWZyd05Ud3RZYTVMVWtSQ0Vnc3VIRW5CcHJBNXVMOXJHYzdYQVluVE9m?=
 =?utf-8?B?THdaM0lQbVc2NXhOZ1RndHNlM0QzRVZ0eW5hRUdDaGhtb3VuaHhGdHRRODE5?=
 =?utf-8?B?aU5Ec3JpUnNmQkNDQzBQZHJQOGpNaXROVDIydXN2RlhSOGRXTk5Bbml4QVJW?=
 =?utf-8?B?NXU2OEMzRXVqZEpDSzVSWVdDVExqdlJMaFUxcWVEdEhBcVBwWlFiZDdsQWwv?=
 =?utf-8?B?RHllZGtVc2RkTDdOTG0xcEZydWdwMzhHVWQyaU5uZ3R0WUkrWjI3TFRaYnBq?=
 =?utf-8?B?bXNvV0xaVFdPUEE0ZFBsZlozdERlclRRWlBKU3BsSUJzV2RQeWV0aThxVkRn?=
 =?utf-8?B?Y1NHYjNjZzlhZWVDN1d3Tys4cHFjMG5GTjR0WDB1b1dhbGsvU2wwUUxwbHo2?=
 =?utf-8?B?a3pmMHhVdmN0aG9CeGJSN21pMit3a0UvZ0xTdnZOK2x3OERCeUt6SmxqUlYx?=
 =?utf-8?B?WktTMmVXTm5Md1J3SlFRSFRsSDlWcnF0Y3Q4MGgrWm5NbFpTelRWTDlVbkFZ?=
 =?utf-8?B?Slg0SlZXd2lXL1R5RDVMUFI2WjRwMWJRbVlHVkpHZFJBenRtSGJvYjhPdExM?=
 =?utf-8?B?SzlISUJ3UmhzNy9wb1YzYnJVN01IM3FNMDlQbDlPQWhXamowTUQyU3I2b29v?=
 =?utf-8?B?R2pyd0NDMDFUbldnOGZnUU45cytjNE5haElYWTBoNHJqTTdMU2FNRkZkRU5n?=
 =?utf-8?B?SXg5dmNzelUvL1NZTHJMbUl0enI2ZEtOb0lyRWR0QWljcENmQ3RkOXllS2hR?=
 =?utf-8?B?QjU0U2plZUxITjdHZGlOR1JmMTNGMGYveno1d3YzVHVxdm5uMDN1ZEQwblJ5?=
 =?utf-8?B?QkwraHFBcEUvenEwcHRjR0tGeVIxMDQ1bVRvQmJvMjBhUURCVGUyUUUzbFc4?=
 =?utf-8?B?YjFFVDVHSW0vZ2ZKMSt6QXZWbGt2VCs4UGtpL2hqY0hSczVTbnhHR1JvRVRm?=
 =?utf-8?B?QVZHdEp2UUVlRGQvY3dMdkVsWmVsZlc3Z2FBUXZJaC9ZOUc2eUZvTXRYMGd1?=
 =?utf-8?B?NWhISERQTlhRa0tNN3JrTkxtOUdPN295WVdVR2tFb0loU0J1clVEUkU4Y0JG?=
 =?utf-8?B?SEZkKzhKME5BbW1WSmNKdlFhSVlidW1TNGNzNUhFSG1nWnAzRTZFYkRoK1dZ?=
 =?utf-8?B?NHI3OS81dnhxM3VMM0lveGpYendzdGtId3REQnREYkM1OC9GNlphSzFQUTB1?=
 =?utf-8?B?ZHQxakQ3bTJVUGkra1BZeHIyN3pOQzc4M09yd3dmc3drbGtTRm95czVMYTlD?=
 =?utf-8?B?TUdyNzhvMzZveFJTUC9ZaFVta25sekVCTk40YWYreExkeWJuY1l2QzBrdmJQ?=
 =?utf-8?B?aElYeGhNVWMyd05Zbnd4cnRJYWlvNWZPSjdsbGM1dnVReGY1VHhraXRFOGxa?=
 =?utf-8?B?U0dsRjdBbkVPaFd2Z2JQOHFPT04yTERHTUg1b2ZrNXJSeXBUU3A5ekM1RWs0?=
 =?utf-8?B?Yk04c0VvR3ZrVmFuQnBhdnVBaksxT0xkZmhYT3FJZXBGK1JFdjFhOHdLd0Ru?=
 =?utf-8?B?bERPancxOWF6cTlHekpUUXFTZ21IQ0FkcFh4YUV3clA5QlRUL3lrRGRJU3A0?=
 =?utf-8?B?TkxqMSt5akxwcnFRUjBMekhlbEdBc3BQWVpYd2RaNFJocEY4U2R6dUUzSDFD?=
 =?utf-8?B?VGhVWEc3bFhVUlh1QlZuYlROUlJ0Q0laayt0MlFyc29BaS9BQXlkSXdTQmpS?=
 =?utf-8?B?T2dCZ0xyaGZRTTh5cWFySWhobmNUeGhQY2JXRFRlVW1WMnQvODl0cXVaTFQz?=
 =?utf-8?B?SHErQmd0c29ZRE9OUVQ4RHVUQlhyUkNZaFpybng1Z21PQzdjaDU5SHBscjNl?=
 =?utf-8?Q?rxanWNFaCRA/BrFGmABP3s/z6T1bx3yNBElg2rG+IM8v?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ea65fa-23b2-4ea6-9d08-08dd39307b3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 08:57:34.5166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r2f3I8X73mRmu+3iekmJ2Is4RckU12tj47GxwArfBMIiBkZF6fQKNWA8oABMLBGccIRlbrWgW3/kD/ADh6S3ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9424

DQo+IEZyb206IFBhb2xvIEFiZW5pIDxwYWJlbmlAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9uZGF5
LCBKYW51YXJ5IDIwLCAyMDI1IDI6MTUgUE0NCj4gVG86IFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZp
ZGlhLmNvbT47IHZpcnRpby1jb21tZW50QGxpc3RzLmxpbnV4LmRldg0KPiBDYzogbWF4aW1lLmNv
cXVlbGluQHJlZGhhdC5jb207IEVlbGNvIENoYXVkcm9uIDxlY2hhdWRyb0ByZWRoYXQuY29tPjsN
Cj4gSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT47IFN0ZWZhbm8gR2FyemFyZWxsYQ0K
PiA8c2dhcnphcmVAcmVkaGF0LmNvbT47IFdpbGxlbSBkZSBCcnVpam4gPHdpbGxlbWJAZ29vZ2xl
LmNvbT47DQo+IGtzaGFua2FyQG1hcnZlbGwuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEx
IDMvNF0gdmlydGlvLW5ldDogZGVmaW5lIFVEUCB0dW5uZWwgc2VnbWVudGF0aW9uDQo+IG9mZmxv
YWQgZmVhdHVyZQ0KPiANCj4gT24gMS8xOS8yNSA5OjA2IEFNLCBQYXJhdiBQYW5kaXQgd3JvdGU6
DQo+ID4gSGkgUGFvbG8sIE1pY2hhZWwsDQo+ID4NCj4gPj4gRnJvbTogUGFvbG8gQWJlbmkgPHBh
YmVuaUByZWRoYXQuY29tPg0KPiA+PiBTZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDI3LCAyMDI0
IDM6MDcgUE0NCj4gPj4NCj4gPj4NCj4gPj4gK1xpdGVtW1ZJUlRJT19ORVRfRl9HVUVTVF9VRFBf
VFVOTkVMX0dTTyAoNDYpXSBEcml2ZXIgY2FuIHJlY2VpdmUNCj4gPj4gR1NPDQo+ID4+ICtwYWNr
ZXRzDQo+ID4+ICsgIGNhcnJpZWQgYnkgYSBVRFAgdHVubmVsLg0KPiA+PiArDQo+ID4+ICtcaXRl
bVtWSVJUSU9fTkVUX0ZfSE9TVF9VRFBfVFVOTkVMX0dTTyAoNDgpXSBEZXZpY2UgY2FuIHJlY2Vp
dmUNCj4gPj4gR1NPDQo+ID4+ICtwYWNrZXRzDQo+ID4+ICsgIGNhcnJpZWQgYnkgYSBVRFAgdHVu
bmVsLg0KPiA+DQo+ID4gRmVhdHVyZSBiaXRzIDQyIHRvIDQ5IGFyZSBub3QgYXBwbGljYWJsZSB0
byBkZXZpY2Ugc3BlY2lmaWMgdHlwZS4gVGhleSBhcmUNCj4gcmVzZXJ2ZWQuDQo+ID4gUGxlYXNl
IHNlZSB0aGUgbm90ZS4NCj4gPg0KPiA+IEN1cnJlbnQgc3BlYyBkZXNjcmlwdGlvbiBpczoNCj4g
Pg0KPiA+IDAgdG8gMjMsIGFuZCA1MCB0byAxMjcgRmVhdHVyZSBiaXRzIGZvciB0aGUgc3BlY2lm
aWMgZGV2aWNlIHR5cGUNCj4gPiAyNCB0byA0MSBGZWF0dXJlIGJpdHMgcmVzZXJ2ZWQgZm9yIGV4
dGVuc2lvbnMgdG8gdGhlIHF1ZXVlIGFuZCBmZWF0dXJlDQo+ID4gbmVnb3RpYXRpb24gbWVjaGFu
aXNtcywgc2VlIDYNCj4gPiA0MiB0byA0OSwgYW5kIDEyOCBhbmQgYWJvdmUgRmVhdHVyZSBiaXRz
IHJlc2VydmVkIGZvciBmdXR1cmUgZXh0ZW5zaW9ucy4NCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhl
IGhlYWQtdXAhIEkgbWlzc2VkIHRoZSBhYm92ZSBwb2ludC4NCj4gDQo+ID4gU28gMiBiaXRzIG9m
IHRoZXNlIHBhdGNoIGFuZCBvZiBwYXRjaCA0LCA0NiB0byA0OSB0byBiZSBzaGlmdGVkIHRvIGJp
dHMgNjUgdG8NCj4gNjguDQo+IA0KPiBJIGNhbiBjb29rIGFuZCBzZW5kIGEgbmV3IHZlcnNpb24g
b2YgdGhlIHNlcmllcyB3aXRoIHRoZSBhYm92ZSBjaGFuZ2UsIGJ1dCBpdA0KPiB3aWxsIHRha2Ug
YSBmZXcgZGF5cyBhcyBJIGNhbid0IHN0YXJ0IHdvcmtpbmcgb24gaXQgYmVmb3JlIFRodXJzZGF5
IGFuZCBJDQo+IHdhbnQvaW50ZW5kIHRvIHVwZGF0ZSBhbmQgdGVzdCB0aGUgUG9DIGNvZGUgYWNj
b3JkaW5nbHkuDQo+IA0KUGxlYXNlIGRvIG5vdCBzZW5kIG5vdyBhcyB0aGUgdm90aW5nIGhhcyBz
dGFydGVkLg0KV2Ugd2lsbCBiZSBhYmxlIHRvIGhhbmRsZSB1bmRlciBhIHNlcGFyYXRlIHBhdGNo
K3ZvdGUgaW4gYXMgZml4dXAgc29vbi4NClRoaXMgd2lsbCBhdm9pZCB2b3RpbmcgcmVsYXRlZCBy
ZXdvcmsuDQoNCkkgd291bGQgbGlrZSB0byBoYXZlIE1pYWNoZWwncyBmZWVkYmFjayBpZiB0aGVy
ZSB3YXMgYW55IHBhc3QgaGlzdG9yeSBmb3IgcmVzZXJ2aW5nIGJpdHMgNDItNDksIG9yIGl0IHdh
cyBqdXN0IGZsZXhpYmlsaXR5Li4NCg==
