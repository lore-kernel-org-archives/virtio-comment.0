Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3BB1537D4
	for <virtio-comment@lists.linux.dev>; Tue, 21 Jan 2025 19:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737488323; cv=fail; b=p2veHUdphspqj/jUIgglEZp3VhOk9eEYMAYfM/5Aoa96IfheEUtLtYlCzZCX9UIjlXP7hbo7uKpcEs8oJ/XFHh1A7bUT0YcDIuzPSo4YeQD6mqucBT7Rr9lOL+sILbWGCZXi5iNyMuQ2rkycvvLMiVYpbRbw6ej+CMuPxacoYL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737488323; c=relaxed/simple;
	bh=3jvPww3nC48cbzDGUG+5B0G1PAOMHBj8djeKqvT+WqI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SAjjYR6EqDU9VPULmBvfTc3ROBtpbX7WMb1T18oI6gv5tpkd7nZycU46P4xEVfE+3ePhTFjntkLIEKxFQkSjACQ0NC6SI7E+pTCfUy+W2CwOA7iJjn575ThmItqXx8x1nqG5AbLf2nbc+mam9TBwS+UwYrIkyR2Jrc5Lrzm47XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FUYnVvAW; arc=fail smtp.client-ip=40.107.102.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FUYnVvAW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4tXc12Xf+kqbp5wPlkqOHknk1HksCnA3e0nkY6sNtVyXz6cSwQuJWuXeULc8N10slN2t+CyyKWupSAzBaV2b5t6z5tnoyDoIuAF34nbbXJrGX1u4431LPlJPVxZh7K5PQANbZpMLb27uqZr4T2x/b4hWPBn5iGjEEq3o3t1/9U5GnwXU1Fq+eMrB8kgYzhODxfxZ4DvH7bSqumwK6K0Ahed484u9ln6Vva1rcO7bgROrzvYC5yOBOw+JGhoj+j/sv76OnVEPWG+fRcktXe2F6Yl6iumuLI47q9bfqMirj4mrdCToowOa1Xjy8Ke9LPQDMKddbVtn+lj+xE8Yf2mVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jvPww3nC48cbzDGUG+5B0G1PAOMHBj8djeKqvT+WqI=;
 b=zPUZlytNfwN8BStPi6PCFBEno/ND1MsH+MO2kpI/mkF+8ygfXyPamQQMmcVHQn9TEH4bw/rT6zfOeQCgo/RZW2t4xynv4Hm7hayl3mfGTPk4nLcZvdXvE4mzUtRt8CgO0uaCBs/W04b3sTdmMg2lzPh5zDzyoQZQa1L+TtWbS5iSHMurHU2r7rBp+rNHz7/+RW2skHPKm+xdtotVv87ILLBzR14PK2zBtK87rQUO6fDw5GZVWI9ODA+DprfDljxHglsZQtls+kQJscalKpKNrcnRuWP1GzrhXtelGZQoN2O9C+mejgoxPzlNsEqqXmwy/cWsYl7fPxpjrbZere2D9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jvPww3nC48cbzDGUG+5B0G1PAOMHBj8djeKqvT+WqI=;
 b=FUYnVvAW3Y5SWIdh8t6hFtUIb+DgFJQwEHnQmz2PY2DFu+cxKhQoZob0N9/y7yxNuRo+l1olKO7qOmBwhrVdwwvNcwbOypLpg1/zTfP3vdTk1pfDLhzG8+grZq4+UcTckyd4VBRyA93LfnKasnQZiyyuuXd8mqIXoForz+yEdZQT++SPFSJ9bQbICYqVbb7mDZdlsKFjk1wprb5iBaEyFw4hEd6V0Z+2RdgKtIz5zPCp4O3Q9+N8J6ivU9rhovUcIBGiutA2Dkxz5j+UF/SqIi0h3206qltVFxdQdb/ivbtU/WNaT0cmKb+G1tve43DouB8J3TzdNicenPNTNvhFNA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH7PR12MB7892.namprd12.prod.outlook.com (2603:10b6:510:27e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Tue, 21 Jan
 2025 19:38:36 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8356.017; Tue, 21 Jan 2025
 19:38:36 +0000
From: Parav Pandit <parav@nvidia.com>
To: Paolo Abeni <pabeni@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, Eelco Chaudron
	<echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, Stefano Garzarella
	<sgarzare@redhat.com>, Willem de Bruijn <willemb@google.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
Thread-Topic: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
Thread-Index:
 AQHbQK/3KR1RJyc06Uq86qDUg7CIZbMeDhsAgAGk7ACAACgGwIAADtUAgAAhHvCAAdtqAIAAECvA
Date: Tue, 21 Jan 2025 19:38:36 +0000
Message-ID:
 <CY8PR12MB719551BDC4C7500B346A27F2DCE62@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <cover.1732699986.git.pabeni@redhat.com>
 <3e1c45071c8cf4efc7ca0ecc7b52a73c6bf983fe.1732699986.git.pabeni@redhat.com>
 <CY8PR12MB7195D914B9EF00FF62C5E1DFDCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
 <87ldv597rl.fsf@redhat.com>
 <CY8PR12MB719550ABC66CDDF8D71E2F7DDCE72@CY8PR12MB7195.namprd12.prod.outlook.com>
 <87ikq98yod.fsf@redhat.com>
 <PH8PR12MB7208F319B0C0380FAD5DA45DDCE72@PH8PR12MB7208.namprd12.prod.outlook.com>
 <2d27f420-d155-4aad-9626-8b42acc0cc22@redhat.com>
In-Reply-To: <2d27f420-d155-4aad-9626-8b42acc0cc22@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH7PR12MB7892:EE_
x-ms-office365-filtering-correlation-id: 7bb23b48-5656-453c-54ac-08dd3a533292
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QnBZTXIwbVpXdDgvTnlrSjhQZVVzaGgxTWh5THBScmF1VFRINEFoLytDb3JY?=
 =?utf-8?B?VDQzRlFnK0xobVYyZFZtVlRhelJrWllteXl5VTB3c1ZLYjFrTGxORWEydGpm?=
 =?utf-8?B?blA2VUFsdmVET0JDY08vWWJyQ0lZLzNjQXQ0RjYzZW4xeGZyMnBiMEVpOGVP?=
 =?utf-8?B?ZUN0ZnlueW9xSkNWaTVKQ1hKdjZjYSt4NHdkK3dKT25tbm9QODBSYWRJRjZL?=
 =?utf-8?B?aktxVk1odm5FMjk4UU9kNTg2RTRkNVhUUzlIS1dBdkw2YmFzSHJqREVQVHJQ?=
 =?utf-8?B?RVo2cG9RTEdJcDh6RjRVTkZZK0pKbFFBMlhSVUJVYjRRNlZHWFIwOG45UGkw?=
 =?utf-8?B?VU81SWlXMkRHam9USHlDdTBKZFRFcCtSOHlnbWZRcmk5eFJxQTkvc1JCcXVG?=
 =?utf-8?B?d3ErRWdyVjJ4YWsxV1g3ZENIVGhQY2ZtTnVCQ2N1MWM2OG84L1ZSNzhFQWM4?=
 =?utf-8?B?cVdycENkaGl6L3Z0UGM4S3FTZ3FmZXRTRTBxd2J1WTZSMVM3U2ViczY4ZDly?=
 =?utf-8?B?dHNNYk5TTTMrU3JuODlQMnArVllBdFVnc29LR0NtSFpUMzQwTmoxV204Uk80?=
 =?utf-8?B?R2FDOG12d0d1T3BEd2lrYzJaTEpvNW50YmJUZ1NnUkZOSm1IVXhWRDIvd0lW?=
 =?utf-8?B?SkZtdXQ2bXBHdXk2YUwrN0ZGQ24vVGxtRDVRRmY5eUZQbTB0TXZ4UnhTR3o2?=
 =?utf-8?B?aDNJSnlqOXhycEJPeDNIVjlscG5NZXhtdVFyN2xhVnVxbVU5WFRUSmNuMFho?=
 =?utf-8?B?NUdCYjZJV0cra3paTGNMRUtpWjQ3YXE5Mlo0TUx5a2NGWloxaDcvcFVQRGt5?=
 =?utf-8?B?NUV3VUdtcEtneisvK1ZYU0RNU1dYdzVUeURlOHQ1VHE3cS9tTXlLMHJMUjFR?=
 =?utf-8?B?ZjNpWWcydWRYYkZPRmZUcWs2QmJLNlpBM2RWRHJRWGtta01DYjEyankzR1R4?=
 =?utf-8?B?TGovM3VMc002R2VEZkw3NlNxa29NZXNLNUtZek5PTXBxSlBSbWkrTTVPZ000?=
 =?utf-8?B?eElabk8rNjB4N2QrR0dmUHIyWFhPMEUwQXFOcmVWMlRjb0lWc0tneW9DSCtz?=
 =?utf-8?B?VTNaV0JVYmdwSXJNMFhRalc1NE4wcGhYSVpSWkN0T3JORWcyR0dKRnQ5Y3J5?=
 =?utf-8?B?Sm95ekF3dmk5bndEMU9QdUdtRStMa09mUFNDNnltLzNrWUJMbGUxbEp3TXJK?=
 =?utf-8?B?bktVOGZKald5Z0h2ZlloV2FGbjk0bE0xTEV1RVd6SzJ6U041aitpeS8wY0dW?=
 =?utf-8?B?VW4vQUVTMmFYd1dSR3pkNXFjQjRYOVNZTk9hMGZHNUlJM3pESEQzOFd4U0tq?=
 =?utf-8?B?UTFVWUdpVGNZN0ExYzF0VERaOU9lV2owQ2dSa2J6VFJUUXNRcTdZOEtBRnR0?=
 =?utf-8?B?V3BsS293ZGxGeitoVktmSzFkL3dSZnNidHJwcldPMUU0YmdtUG5aRFhNMUk5?=
 =?utf-8?B?WlNmZ2tDQUJNazdCeFNUOW5rYmdBVFJNbWYrSnA4eFROSGtPRUlOWmw5NUx1?=
 =?utf-8?B?NG12emhSWTI1TTlNQWlsMERyVXlQK2pxUXNEOTYzbEo3WkFLSzI1OExiY0dW?=
 =?utf-8?B?SkdGbFppcFhCUlBsZGpvMG0wMzUwVnNZVEZBMVZpa0VCLzlwd3BwOFlKbzYw?=
 =?utf-8?B?VkZrY1dOZlZZUjRwUlhFK0drYlhNdGphc2YzM2VqRnVuZUsrWFIyd1k0VjM0?=
 =?utf-8?B?L2dxZ1d4UDhSM2k3eXVzME80Uk81cWFOdjFDMVlSQXpNSkNWUDdtTUlkR3FN?=
 =?utf-8?B?dXA0N1BSVHB6ZWkxWVEvMGl2NkFiVDQ2b3UzRGZJTVB1WS94ZzRxWkZYQWdu?=
 =?utf-8?B?dEdtY05TNjNwSVFrQkl2aHBhQ3ByczJDZHdBOEM1YjBtYVE5WGFHUnRzbFBq?=
 =?utf-8?Q?KRXF3HmO78Njw?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUh5TUVTMnlPbEJUbHM5eitNd0FtcjcyaDNuM28zTHVDYmtoMUhNb0YwcHo1?=
 =?utf-8?B?U2JJbFVrblVROHFzakt4VVVQQ1pXMi9iTFAzYTJTTmpnWXlicUQwcDlkaGZN?=
 =?utf-8?B?ZFpYVUdES1NQczQ0UitaY0dNUkllK1JnU1lkT1REYUYwc2ZVQjYydFBtSzlm?=
 =?utf-8?B?K1dwd2dGdDltM2xnZWtrdTQxZVR2ZmdkRTl1UUNWTmpvSTFMZ01zczZENWRO?=
 =?utf-8?B?YnNSNGM3c3cxNjBFQTc5eTU0dWczRzVlNjMzajlZSmJuODhIYW5PZTJDYmJT?=
 =?utf-8?B?bUcxck8wN0RNZHRDV3d2Q1dZS01ESU9scHl6U1ArdXZmVFdWakg3MEhLdXky?=
 =?utf-8?B?cDhJcDYvUXJ1STUvWWJmUGw2T1h5a2NCNEhVdGNQRkRwZXgwNFA0UzVwUnFJ?=
 =?utf-8?B?SjRIZ2xLSlh0d0RtYktLTDZodWhVTDF6dzFSWDZnY0x6endVYXhQZFVFMU5k?=
 =?utf-8?B?aXJrUFBXb2pFTUcrYk1FS044ZmNMM1lYeG1KV01QMHBHOU5FUE9hcDlrMXZK?=
 =?utf-8?B?S3EzRjZFUUhIWERyaFMxc1A4TU1YYjZSUnlKaEVZT0RLVmovVldoVUdza2xQ?=
 =?utf-8?B?Q1FhMm5MOHZPWW5idzE4ZVRPQW5Kbk1QY1lEMGVmUnBGQlN5cU84ejQwTGZL?=
 =?utf-8?B?NE1HZE1TUFBIZ01wTWdpTlBzVElSTXAveVJhYitPUFlLZTBBakNYZFlhWU1X?=
 =?utf-8?B?SlRNS3hPclpGb2JvMXdMelJ3RnRjcDR0Zkw3YVp1aGRyWWpvMk5aZ3Q2Rm1E?=
 =?utf-8?B?clhJNnFUQTh5RmljWHJkaGxoNk15dUtpWVBVNWxGa0VWK05BTDdhR214SUo2?=
 =?utf-8?B?VWtiQjFxUm1UNFd6dHpINTloVUUxMEIxZHEwQ05meHhrTm8ydG9jeG53alc2?=
 =?utf-8?B?TmlkKzd4d2diamhQdGlGQWRJcTYxcEJMRWFNc01vSzBUZ3hTbVVkUnZJcFNH?=
 =?utf-8?B?MTIyd25jMGtUUXNIazdUTGovTFpzdmJkVmQ0MjAzS0d6SGsrK2dWTHFHd2h4?=
 =?utf-8?B?Tkt6Zi94YjRFV3dCZlhnM1MrQ0lmViswenhISGIvd0t0YjFFSksxdm90Z09y?=
 =?utf-8?B?a1NETFFocS9ZVUpHVndHUDdkUlVra3JRQWh5UXR6cXJEOTBCTUpZbXNkbXd3?=
 =?utf-8?B?RDhoL3JwT1o3TFF0Q0FidGtnaUhHS0Y4eWpEUUxBWWlnd0FNSnVYWTZUVXZm?=
 =?utf-8?B?Y2FLZTdWN3ViTTFpSEQyRTQ5a3VkY3Rqa3QrUFF3ZzU0dVg3ek9vdUhPL05x?=
 =?utf-8?B?YUw0eHVoSlNSRUNiTnVXM09zZmZ3ZWdKTm44cVhjbHR2cXlNZFliZjVZbk52?=
 =?utf-8?B?T2huaDRPa3prcTNBRjVnejRNVWNzYjlIWEZuR1RBbW45K04yME1PajlEbUtS?=
 =?utf-8?B?d1RjamhKdXZFUGNWaXN0eVZzUHFpQ0d2ajBNZ2FPZmQ2QXNUVnI5NGY1dGFX?=
 =?utf-8?B?aVFSY01mNFIyczhSaXVKQ0R2UWtQK2oxak5zQ05yTkt2RWRxNzFQRTJnUWp1?=
 =?utf-8?B?V0liSmRpMGdTejdDQ2srNDcxK2x6WmIySU9ndmIrZE1xV2JucFladEdjZlRE?=
 =?utf-8?B?RFdidlVKZXJ1N1FEek5USmRZOE9xNTdHdGhTc1N6NEtwS2tUZll3N09UdlRo?=
 =?utf-8?B?QlZQNUdyVUpxT3RMK09IbitJZFV1dmphVGxZME10YWRXMCs4S055dDN4U242?=
 =?utf-8?B?QkE4YlZFZjNoS0o3SWZpREtOL3NnQzZoTmN6eVZ1SG82L1ZETFpTOHg0dlhN?=
 =?utf-8?B?WFpwY3B4LzFUMVA4Wk5LRDdKMXV3MytLNkFIaEQzUWlFd2l5aGxhRHRhNjFD?=
 =?utf-8?B?SXRqWU15YWtyT28rUWx0N0Z3ZEZFQXlmSGRXVVFPY2RVdDB5U0ZUZU1qNFlP?=
 =?utf-8?B?ZmlGQW96R1BsYVFoZkdlZ0I1MjhITzcvQm9OUVU1L2NvU3pQWFMzZVcyN2xq?=
 =?utf-8?B?MFVZcGVGSGNWemRLWi9jNTUwQUo2SHpULzUvUHYzZ1V1cFlaZzJIQytCVDZD?=
 =?utf-8?B?Y0xxMW83UGZaaHdmWGV0dUdVbStHRWVEWWV1RkIxMmthOE83akY2Z2tYdFNq?=
 =?utf-8?B?QU5DV1hTQ21uOVBnWE16bG1JWHdVZmtHM1RlVUpOa0h2MWRmZGNZY2ZmLy9F?=
 =?utf-8?B?SFd3Z3Q2bDlMMXY2bzB0ZU0yNXVqRGNYWjdjWnM0Rk9iM1hLS3NkYUUrem1W?=
 =?utf-8?Q?c67BAJSzzRgGkj+jdVjstsCMJIQSTDItiXDstyk5++8M?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb23b48-5656-453c-54ac-08dd3a533292
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 19:38:36.1445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wdIX/iYWRIWdD20cT6bVzBIu8SU3v8pllhcHj57el3L5C8RVkyF4VNso0DkMEV79Cm1ikhZ194cQuxw3v56qjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7892

DQoNCj4gRnJvbTogUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIEphbnVhcnkgMjIsIDIwMjUgMTI6MTAgQU0NCj4gDQo+IE9uIDEvMjAvMjUgMzoxOSBQ
TSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+DQo+ID4+IEZyb206IENvcm5lbGlhIEh1Y2sgPGNv
aHVja0ByZWRoYXQuY29tPg0KPiA+PiBTZW50OiBNb25kYXksIEphbnVhcnkgMjAsIDIwMjUgNTo1
MCBQTQ0KPiA+Pg0KPiA+PiBPbiBNb24sIEphbiAyMCAyMDI1LCBQYXJhdiBQYW5kaXQgPHBhcmF2
QG52aWRpYS5jb20+IHdyb3RlOg0KPiA+Pg0KPiA+Pj4+IEZyb206IENvcm5lbGlhIEh1Y2sgPGNv
aHVja0ByZWRoYXQuY29tPg0KPiA+Pj4+IFNlbnQ6IE1vbmRheSwgSmFudWFyeSAyMCwgMjAyNSAy
OjM0IFBNDQo+ID4+Pj4NCj4gPj4+PiBPbiBTdW4sIEphbiAxOSAyMDI1LCBQYXJhdiBQYW5kaXQg
PHBhcmF2QG52aWRpYS5jb20+IHdyb3RlOg0KPiA+Pj4+DQo+ID4+Pj4+IEhpIFBhb2xvLCBNaWNo
YWVsLA0KPiA+Pj4+Pg0KPiA+Pj4+Pj4gRnJvbTogUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQu
Y29tPg0KPiA+Pj4+Pj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyNywgMjAyNCAzOjA3IFBN
DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+ICtcaXRlbVtWSVJUSU9fTkVUX0ZfR1VFU1Rf
VURQX1RVTk5FTF9HU08gKDQ2KV0gRHJpdmVyIGNhbg0KPiA+PiByZWNlaXZlDQo+ID4+Pj4+PiBH
U08NCj4gPj4+Pj4+ICtwYWNrZXRzDQo+ID4+Pj4+PiArICBjYXJyaWVkIGJ5IGEgVURQIHR1bm5l
bC4NCj4gPj4+Pj4+ICsNCj4gPj4+Pj4+ICtcaXRlbVtWSVJUSU9fTkVUX0ZfSE9TVF9VRFBfVFVO
TkVMX0dTTyAoNDgpXSBEZXZpY2UgY2FuDQo+ID4+IHJlY2VpdmUNCj4gPj4+Pj4+IEdTTw0KPiA+
Pj4+Pj4gK3BhY2tldHMNCj4gPj4+Pj4+ICsgIGNhcnJpZWQgYnkgYSBVRFAgdHVubmVsLg0KPiA+
Pj4+Pg0KPiA+Pj4+PiBGZWF0dXJlIGJpdHMgNDIgdG8gNDkgYXJlIG5vdCBhcHBsaWNhYmxlIHRv
IGRldmljZSBzcGVjaWZpYyB0eXBlLg0KPiA+Pj4+PiBUaGV5IGFyZQ0KPiA+Pj4+IHJlc2VydmVk
Lg0KPiA+Pj4+PiBQbGVhc2Ugc2VlIHRoZSBub3RlLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBDdXJyZW50
IHNwZWMgZGVzY3JpcHRpb24gaXM6DQo+ID4+Pj4+DQo+ID4+Pj4+IDAgdG8gMjMsIGFuZCA1MCB0
byAxMjcgRmVhdHVyZSBiaXRzIGZvciB0aGUgc3BlY2lmaWMgZGV2aWNlIHR5cGUNCj4gPj4+Pj4g
MjQgdG8gNDEgRmVhdHVyZSBiaXRzIHJlc2VydmVkIGZvciBleHRlbnNpb25zIHRvIHRoZSBxdWV1
ZSBhbmQNCj4gPj4+Pj4gZmVhdHVyZSBuZWdvdGlhdGlvbiBtZWNoYW5pc21zLCBzZWUgNg0KPiA+
Pj4+PiA0MiB0byA0OSwgYW5kIDEyOCBhbmQgYWJvdmUgRmVhdHVyZSBiaXRzIHJlc2VydmVkIGZv
ciBmdXR1cmUNCj4gZXh0ZW5zaW9ucy4NCj4gPj4+Pj4NCj4gPj4+Pj4gU28gMiBiaXRzIG9mIHRo
ZXNlIHBhdGNoIGFuZCBvZiBwYXRjaCA0LCA0NiB0byA0OSB0byBiZSBzaGlmdGVkIHRvDQo+ID4+
Pj4+IGJpdHMgNjUgdG8NCj4gPj4+PiA2OC4NCj4gPj4+Pj4NCj4gPj4+Pj4gT3IgYW4gYWx0ZXJu
YXRpdmUgd291bGQgYmUgdG8gYW1lbmQsDQo+ID4+Pj4+DQo+ID4+Pj4+IEJpdHMgNDYgdG8gMTI3
IGZvciBzcGVjaWZpYyBkZXZpY2UgdHlwZSwgQW5kIDQyIHRvIDQ1IGFuZCAxMjgNCj4gPj4+Pj4g
cmVzZXJ2ZWQgZm9yIGZ1dHVyZSBleHRlbnNpb25zLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBNaWNoYWVs
LA0KPiA+Pj4+PiBQbGVhc2UgbGV0IG1lIGtub3cgc28gdGhhdCBJIGNhbiBoYXZlIHRoZSBmb2xs
b3cgdXAgcGF0Y2ggdG8gdGhpcw0KPiA+Pj4+PiBvbmUgYXMNCj4gPj4+PiB2b3RpbmcgaXMgc3Rh
cnRlZC4NCj4gPj4+Pj4gQW5kIHRoZSBmaXggaXMgcmVxdWlyZWQgZm9yIGl0Lg0KPiA+Pj4+Pg0K
PiA+Pj4+PiBJcyB0aGVyZSBhbnkgaGlzdG9yaWMgcmVhc29uIGZvciA0Mi00OSBhcyByZXNlcnZl
ZCwgb3IgaXQgY2FuIGJlDQo+ID4+Pj4+IHVzZWQgYXMNCj4gPj4+PiBwcm9wb3NlZCBpbiB0aGlz
IHBhdGNoPw0KPiA+Pj4+PiBJZiBpdCB3YXMgb25seSBrZXB0IGFzIGVsYXN0aWMgYnVmZmVyIGZv
ciBkZXZpY2UgZ2VuZXJpYywgYW5kDQo+ID4+Pj4+IGRldmljZSB0eXBlIHRvDQo+ID4+Pj4gZ3Jv
dyBpdCBpcyBwcm9iYWJseSBvay4NCj4gPj4+Pj4gVXNpbmcgNDYgdG8gNDkgaGFzIHNtYWxsIGFk
dmFudGFnZSB0byByZXVzZSBpbiB0aGUgb2ZmbG9hZHMgYml0IGFzDQo+IGJlbG93Lg0KPiA+Pj4+
PiBQbGVhc2UgY29uZmlybS4NCj4gPj4+Pg0KPiA+Pj4+IFNlZSB0aGUgcmVhc29uaW5nIGdpdmVu
IGluIDg4ODk1ZjU2ZTY0MiAoIlJlc2VydmUgbW9yZSBmZWF0dXJlIGJpdHMNCj4gPj4+PiBmb3Ig
ZGV2aWNlIHR5cGUgdXNhZ2UiKSAtLSB0aGUgaWRlYSB3YXMgdG8gcHVzaCBvdXQgdGhlIHBvaW50
IGluDQo+ID4+Pj4gdGltZSB3aGVuIGdlbmVyaWMgZmVhdHVyZSBiaXRzIHdpbGwgaGF2ZSB0byBi
ZSBpbiB0aGUgYml0IGFyZWEgYmV5b25kDQo+IDYzLg0KPiA+Pj4+IEdpdmVuIHRoYXQgd2Ugb25s
eSB1c2VkIG9uZSBvZiB0aG9zZSBnZW5lcmljIGJpdHMgaW4gdGhlIG1lYW50aW1lLA0KPiA+Pj4+
IEkgYXNzdW1lIGl0IHdpbGwgc3RpbGwgYmUgc29tZSB0aW1lIGJlZm9yZSB3ZSBydW4gb3V0IG9m
IGJpdHMsIGV2ZW4NCj4gPj4+PiBpZiB3ZSBsZXQgdGhlIG5ldCBkcml2ZXIgZ3JhYiBzb21lIGJp
dHMgdGhlcmUuIFN0aWxsLCBJJ2QgcHJvYmFibHkNCj4gPj4+PiBwcmVmZXIgdGhhdCB0aGUNCj4g
Pj4gbmV0IGRldmljZSB1c2VkIGRpZmZlcmVudCBiaXRzLg0KPiA+Pj4+IFtBbmQgaXNzdWVzIGxp
a2UgdGhpcyBhcmUgZWFzeSB0byBtaXNzIGR1cmluZyByZXZpZXcNCj4gPj4+PiB1bmZvcnR1bmF0
ZWx5Ll0NCj4gPj4+Pg0KPiA+Pj4gSSBtYWRlIGFzc3VtcHRpb24gdGhhdCBvbmUgd291bGQgaGF2
ZSBwaWNrZWQgdGhlIGRldmljZSBzcGVjaWZpYyByYWdlLg0KPiA+Pj4gSSBtaXNzZWQgdG8gZGV0
ZWN0IHRoaXMgZWFybHkgZW5vdWdoLCBteSBiYWQuIDooDQo+ID4+Pg0KPiA+Pj4gR2l2ZW4gdGhh
dCB3ZSBhcmUgb25seSBsZWZ0IHdpdGggNCBiaXRzIGluIHJhbmdlIDQyIHRvIDQ1LCBhdA0KPiA+
Pj4gZ2VuZXJpYyBsZXZlbCwgaXQNCj4gPj4gc2VlbXMgd2lzZSBmb3IgZGV2aWNlLXR5cGUgdG8g
Y29uc3VtZSBmZWF0dXJlIGJpdHMgaW4gaXRzIGRlZmluZWQgcmFuZ2UuDQo+ID4+PiBGb3Igdmly
dGlvLW5ldCwgYml0cyA2NSBhbmQgaGlnaGVyIGFyZSBwcmVmZXJyZWQuDQo+ID4+Pg0KPiA+Pj4+
IEhvd2V2ZXIsIGlmIHRoZSBkZXZpY2Ugd2FzIHRvIHVzZSBkaWZmZXJlbnQgYml0cywgdGhlIGNs
ZWFuDQo+ID4+Pj4gc29sdXRpb24gd291bGQgYmUgdG8gd2l0aGRyYXcsIHJlc3BpbiwgYW5kIHJl
dm90ZS4gSWYgd2Ugb25seQ0KPiA+Pj4+IGNoYW5nZWQgdGhlIHJlc2VydmVkIHJhbmdlcywgd2Un
ZCBiZSBmaW5lIHdpdGggYSBjaGFuZ2Ugb24gdG9wLCBzbw0KPiA+Pj4+IHRoYXQgd291bGQgYmUg
bGVzcyBoYXNzbGUgaW4gdGhlIHNob3J0IHRlYW0uIElmIHdlIGRlY2lkZSB0aGF0IHdlDQo+ID4+
Pj4gY2FuIGxpdmUgd2l0aCB0aGUgc21hbGxlciBmZWF0dXJlIGJpdCBzcGFjZSBiZWxvdyA2Mywg
SSdkIGJlIGZpbmUgd2l0aA0KPiB0aGF0IHNvbHV0aW9uLg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4g
SSBhbSBmaW5lIGVpdGhlciB3YXkgdG8gbWVyZ2UgdGhpcyBhbmQgZml4IGltbWVkaWF0ZWx5IGZv
ciB1c2luZw0KPiA+Pj4gYml0cyA2NSBhbmQNCj4gPj4gaGlnaGVyLg0KPiA+Pj4gTXkgcHJlZmVy
ZW5jZSBpcyB0byB1c2UgYml0cyA2NSBhbmQgaGlnaGVyLg0KPiA+Pj4NCj4gPj4+IE9yIGFzIHlv
dSBzdWdnZXN0ZWQgdG8gcmVzcGluIGFuZCByZXZvdGUgcmlnaHQgYXdheSB0byBmb3J3YXJkIHdp
dGggYml0DQo+IDY1Lg0KPiA+Pj4NCj4gPj4+IFBsZWFzZSBsZXQgbWUga25vdy4NCj4gPj4NCj4g
Pj4gUGVyc29uYWxseSwgSSdkIHByZWZlciB0byBoYW5kbGUgdGhpcyBpbiBhbiAiYXRvbWljIiBt
YW5uZXIsIGkuZS4NCj4gPj4gbWFraW5nIHN1cmUgdGhhdCBubyB2ZXJzaW9uIGV2ZXIgaGFzIHRo
ZSB3cm9uZyBiaXQgbnVtYmVycy4uLiBtYXliZQ0KPiA+PiBpZiB5b3UgZGlkIGEgZml4dXAgcGF0
Y2ggdGhhdCBjaGFuZ2VzIHRoZSBudW1iZXJzLCBhbmQgY29tbWl0IHRoZXNlDQo+ID4+IHBhdGNo
ZXMgKyB0aGUgZml4dXAgYWxsIGF0IG9uY2U/IExlc3MgY2h1cm4gdGhhbiBkb2luZyB0aGUgcmVz
cGluIGFuZA0KPiByZXZvdGUgZGFuY2UuDQo+ID4+DQo+ID4gSGVyZSBpdCBpcy4NCj4gPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy92aXJ0aW8tY29tbWVudC8yMDI1MDEyMDE0MTA1Mi44NzczNTUt
MS0NCj4gcGFyYXZAbg0KPiA+IHZpZGlhLmNvbS9ULyN1DQo+ID4NCj4gPiBEbyB3ZSBuZWVkIHRv
IG9wZW4gYSBuZXcgdm90aW5nIHJlcXVlc3QgZm9yIGl0PyB5ZXM/DQo+IA0KPiBJJ20gc29ycnkg
Zm9yIHRoZSBsYXRlbmN5Lg0KPiANCj4gUGxlYXNlIGJlIGF3YXJlIHRoYXQgVklSVElPX05FVF9G
X0dVRVNUX1VEUF9UVU5ORUxfR1NPIGFuZA0KPiBWSVJUSU9fTkVUX0ZfR1VFU1RfVURQX1RVTk5F
TF9HU09fQ1NVTSB2YWx1ZXMgYXJlIHJlcG9ydGVkIGEgMm5kDQo+IHRpbWUgaW4gdGhlICJPZmZs
b2FkcyBTdGF0ZSBDb25maWd1cmF0aW9uIiBwYXJhZ3JhcGguIEkgZ3Vlc3MgZXZlbiBzdWNoIGNo
dW5rDQo+IHdpbGwgbmVlZCBwYXRjaGluZy4NCj4gDQo+IC9QDQpPay4gd2lsbCBmaXggYW5kIG9w
ZW4gZ2l0aHViIGlzc3VlIHNvIHRoYXQgd2UgY2FuIG1lcmdlIGJvdGggdGhlIHByaW1hcnkgYW5k
IGZpeGVzIHBhdGNoZXMgaW4gb25lIGdvIGFmdGVyIGJvdGggdGhlIHZvdGluZ3MgYXJlIGRvbmUu
DQo=
