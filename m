Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A3F26A0A6
	for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645446; cv=fail; b=VfqZgP5BkzEsMk9qBZqUk8xWBgC4xXIQG9s/5XK4AF2lmxa0uOn2cQZ78WEX+9AcoenU86Hadg5Znnmp8w0Teq4YVWIeR6fNatShogj50KK3l5mCpA7UQbIrcFAPsrpu7oscEBULN/fW4ZToR1D73pk+af6o0zJno2Z719RdR8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645446; c=relaxed/simple;
	bh=KYhbUyPq1XANk8KZy+fcxYwYgitLIghqPXSu6I23h58=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tvaKFzCP3N5HYO5S8tw24XE0ehbmtrFuXi1TKytXYurh2qol1I2fhhV/JkPqcMfBfHzEcS+1bLrOk8NDg3/K3aHP23NUw2mQdYt96hk4yAH+0dNlkMCyUhSu0KdPAwr7veYcWYEJ3TZ09/Kla24PjQ7lC1t6J+lDq0VyTk/ubo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kP8Gc66r; arc=fail smtp.client-ip=40.107.237.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kP8Gc66r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppimVbYvFOFK2AwQVA4b/6yQjMonB9GwNGFIgnSd0wlAUc7cBCev8pwBZqmpWMZgvlwEvxdawr2dC0F4Xy7QxjdnPa3joYQ1qIZQwfI+ElAbFfWk/tZ0ZOgv+kG4xPbaCpb+Zk9kx2b4ju40Y8XI76lSU6E/8d7lsZgFa6pwfccDbHUMf8IL+G27LB7dPj/QE1CwH8Aq9Lpc/k8xLb1QMkgshmAi0Jcc21ygRIUxNYKieILlyGcHVb7noqwv+mWbgbQEHTgk+eEyue0dP6msMJbqYDPNVlxiw2kbBxG8WAPxiV1YRJxq962kBK9iZqL20kCk9VHTx+t97r6Df96Aag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYhbUyPq1XANk8KZy+fcxYwYgitLIghqPXSu6I23h58=;
 b=JHLL3cR6SmEIP3Nare3AdIlORyRi7gVanTB4USxeqEpsatS9J2dtTdAA+vCvKPycUqOYyfONoyRapaBul+pUIyf3eHCCEPvYetVBf6kfzUXtMwXT36gGGjax65a5R1LgyJiZ5iYITWNcjW0tF0PKkGpo7d5XJ+mpYyL+YXhu7txLn0tUNc4IfMpZWS0tArePAwQmbB+rcV02Ok/uBNKYTG5pV6PSBRkg9/92/3FRTKyNIygZc2lSxSp2ye0sfSeuCVeRFM48DKu0B+q/GYAlYJCJAqnTtZdAlUOybp2qWN+wmH2NkI2F0ifoum5nAwx1dQRBO+CXFUXAw08fXc6nZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYhbUyPq1XANk8KZy+fcxYwYgitLIghqPXSu6I23h58=;
 b=kP8Gc66rHSaqpvvfPS1SXcm1Ar2giRohOv4iN7geu1aL7KGN142zii/E9ZZiA8ORgIQ4oga+mfHndgGSfIXn2L/VjXwagnk+8MEKMZq1NnvEhxTnihZpDoBlz0MxgWygrzooik0vDu4BueqcSblzmX5sjWp8hFvB8Wr0n2Shzjan1atmC6JG0krmCvgjxene8v+2AMZxiBD7vcRgZMObyxckM8/yrhHwgTqlYhcbXkY1Cx4iGNGwIZU4EzjkTXZx4GST43y3jrYVrwFcSWs4h4ZkqnbkRNhIF4i38gtmtIJ2TyIFac+haa0QWTOO63Fm6yXPI1mpGf2GBVP1N2BWew==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SN7PR12MB6888.namprd12.prod.outlook.com (2603:10b6:806:260::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 09:04:01 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%4]) with mapi id 15.20.8699.026; Mon, 19 May 2025
 09:04:01 +0000
From: Parav Pandit <parav@nvidia.com>
To: Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, Jason Wang <jasowang@redhat.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Willem de Bruijn <willemb@google.com>, Daniel Verkamp
	<dverkamp@chromium.org>
Subject: RE: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Thread-Topic: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Thread-Index:
 AQHbb7qQTK1IFlk3mUyW0rZK+XznHbOwfmOAgADIVQCAALOCgIAAG2mAgAc9KICAAlyQAIAAgdHAgABgHoCAAAjkMIABxDWAgAdaTsCAACB8gIAAEGTggABgHYCAAAQDQIAADS6AgAAKScCAAShCAIASy0iAgAABe1A=
Date: Mon, 19 May 2025 09:04:00 +0000
Message-ID:
 <CY8PR12MB7195C1BA2C27B1E332B2FD21DC9CA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250423014257-mutt-send-email-mst@kernel.org>
 <20250423140404-mutt-send-email-mst@kernel.org>
 <bb5dd95a-15d5-4785-822c-e2b1e773950c@redhat.com>
 <20250429164256-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195AB46624A4339A305BE1CDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
 <68c4e73a-fa9e-4e2e-8c38-ed4a322bf47e@redhat.com>
 <CY8PR12MB7195E87CBF30EB5C7705835DDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250501093933-mutt-send-email-mst@kernel.org>
 <PH8PR12MB7208BA2F9A48EEBF42B15AE0DC892@PH8PR12MB7208.namprd12.prod.outlook.com>
 <20250506035434-mutt-send-email-mst@kernel.org>
 <PH8PR12MB720860F36BE0C9E7C1C35A0EDC892@PH8PR12MB7208.namprd12.prod.outlook.com>
 <862ef83f-9ed8-4d50-85ca-36231e93514a@redhat.com>
 <CY8PR12MB7195FC058918DCC17E56FF80DC89A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <2c880e08-9d92-45ee-be92-3bfc758e928c@redhat.com>
 <CY8PR12MB71953CA2DC3CD5608BA54D02DC89A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <758156c0-7cc7-4af4-b5eb-1339b3b9b437@redhat.com>
 <4df60cbe-ace1-41ae-9d24-5f548e780f82@redhat.com>
In-Reply-To: <4df60cbe-ace1-41ae-9d24-5f548e780f82@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SN7PR12MB6888:EE_
x-ms-office365-filtering-correlation-id: f74e9c86-54ab-401e-b568-08dd96b418c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b1c0NWNTWmg5RWh4d2k2YjhFSWdnOHh0dnhNZWNkTnlFN09YVjZGbmsrOVZW?=
 =?utf-8?B?MXVzZitFU1BKY3NzTndmY2ROWEJrV3VXY0N5b0UwZlQ2NUVGeEFsaUxUeW9h?=
 =?utf-8?B?SHk4UzRFY3lHQVVaK2s4V21yeUVBaHpQRTR5QysySVNKSGNVTG1mQjd4eTNS?=
 =?utf-8?B?ZWEwTDhTLzJCTnIxKzRKTElmTU1EK0VRdHBTV1NEbDNuZDZzblZQSW4xRFZ6?=
 =?utf-8?B?ZENwaXBISk9LZXd2TXIzSTlkRE9MQVVjWEkvS2V6Uktlc211SDl2YUE2cW5X?=
 =?utf-8?B?Q2hWWTduSVFRUnZSQUEwZVNuQ0tzTlFoNEdoekx3ZEV3V1U2NDR6NVRNV3hO?=
 =?utf-8?B?NmNxSEIrbUxCS3dCUTVHK1lKaGh1VGhYV2M4V3FNM29MRXNJenI1SERGc0U2?=
 =?utf-8?B?Qk5GUkk5RHl4Z1A3QUtFNEgyTFFTWThUTG11VXNIQ1JnaURVUnBpWnpWU2cr?=
 =?utf-8?B?aitsbk1UQkpiY0d2QTVmcmlWYUlaaFVhM1VGYVRBREhqWWRuWVhMd0JJaHNM?=
 =?utf-8?B?SlBiMHVKc2tmSWZBVE1wdHIzSDF4c2J4SFhQcUs5Uld5emliejYzZ29NdDZB?=
 =?utf-8?B?ZHRTc2JwK3AvZmRXVkpNMklHNzlzL2NQZno2Uk83bHRsVnliamJvd1JSb2xJ?=
 =?utf-8?B?RWg5MHFBUktTeHYraXVlMGI1NDhCeUJGWlV6WGV2d0ZjRjA3QmJuVzEvTnp5?=
 =?utf-8?B?cGEzbUo4dkMwR0g1WWdIWGRKUGlrMkltNWRhTDFiV3M0ZTVSRjhPNDJBY1JO?=
 =?utf-8?B?bGN2aHZ3WEE5WURBZDFtckVJR0ZXYkhXMkJFUmhRcDBuVS9nT25yeEdneVlF?=
 =?utf-8?B?ZmRYUlg0OElOOTBCQXJjV09NN29aQXRhTDdzNDZjcERIakloUzNDVGpWSTI2?=
 =?utf-8?B?ellsTHJha2JRQ1hrSUt0ZjZRcHlYa2Fmc3BLaVFTeVJ0aDhLdVh4RTB0TjBs?=
 =?utf-8?B?SEZuTi9RQ1RMNWVuL21adGtwS1MzWDFWQklKb0NTaC9aREgrUldsK3pDUFo0?=
 =?utf-8?B?ajIva2RUbkNVSXB3NmJYcFA4Q3dKUitTZDNuUWdxdEN5ZDUvOUZVclpLem8x?=
 =?utf-8?B?QXVaL09XNjg5cDU5Q2J4enc1TUFvQUNPUmU4aU9wWWM2b2tUMW5QQlp2djJV?=
 =?utf-8?B?SzVScXBzQTh5K1lmYXFzTXVPdEc1R0dmQnRwL3NQbjJwbWozV1kxc0VuMlY4?=
 =?utf-8?B?K3l6RHpUb0VxYkJXUytXT29veU0vQlBMczhXb1NpbkxVT2I3Y3JPb2VFQkM2?=
 =?utf-8?B?QUR4RnpSUk5ENERURXRXd3V3eUxFYjl4RU80ay8xUHpCbUk1bFVUalpZTWZX?=
 =?utf-8?B?anI2NXU3RFNNVGYyRFRhTFpONVdRdWgrbkU5TjByUzBnc2VERDE0MHl3RE1s?=
 =?utf-8?B?ZTZvUWJ6YWNJa1ZvVGh0VGlqRFJxOGpnNkJVYk9xZGNjaTFJenpmUmowNXU5?=
 =?utf-8?B?Y3A1ODRITG8zbjBEc1RWaWRZYkxYQ25ldUpZTmNEaWFEN0JDVDNaYSs5Z2dW?=
 =?utf-8?B?M1puNDFncG0vWWdydFhBdUNobkNHaWI3Wkh4ZHU5WHJXMnFzbVhhQ2RyNXFo?=
 =?utf-8?B?d0RTZ3lhWWdoYXhRenlzTlBUeXpVMWJrRmxnTG02MVh4VWxmUE5uUXRlZTQ0?=
 =?utf-8?B?NnFhWlQ1TW0xMmo4M0t3dk42ZVR5TFdBSEZaVTlFbVdCK3FMT1dieS9DZWZ0?=
 =?utf-8?B?d0xmZitIQUR1S2JleUdyZ2dUblA3NWJwaUd2YWZrYTdzQzV2aFRWV3dUN0lI?=
 =?utf-8?B?MnR4QUI2QlRBVUhvcEhTT3JqaHdPLzc5VG9XV2p1c3VlWm05NFNSTTJ4Uzd3?=
 =?utf-8?B?SzJscUkzcThMaXVVWStKTkJNYzZUcjB0eHQweEhhZXFKd0dzRkd0RUFJMUh6?=
 =?utf-8?B?MFZZMytzQ3dadnl5d2VLVGJIUmFJOUtXZVR0YmVEZ1dtSzZqZjJLVXZTU3Yr?=
 =?utf-8?B?b2ZSZFpWTVh3OGZYRTJHTy9oS3RQV1dOOHNTcXhJdnhCNmJqZ25Kc0tPL05U?=
 =?utf-8?B?eWZGL2gzYWZ3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZWcxd1J2VW04UXMydmZOSGowN3FkVEJ3OC9LQzFBZC9OQVdTUlNJYjV2Z25r?=
 =?utf-8?B?MldnM3BrVDZYVFdUVW5CZktjUGxHZGRNRmk5WDYvYnRLd3p1YnZCL3hQeEZK?=
 =?utf-8?B?bUc2eTUycGdUVnhUZzlGOSs3bzltelFnUnQyQW43NUdwc25LcUZIbjZIZHdF?=
 =?utf-8?B?eFVOYi9aMUVtbVlpZFI5VXZpOWIxcGxFWmJuazNMVllCYThsQkhYZEhSUFZu?=
 =?utf-8?B?ai9DcDlsSkQ5S2xiMVg4TGZUdHRNVS9ZUlpJckNSdFBBb281QUVvZ3FaQk4r?=
 =?utf-8?B?WWRmNk5Kb01KbVpkTnBrcFFHM1ljTkQrUUFsRGlDMXROT0F0MXlvWXA4RjZx?=
 =?utf-8?B?UnNidk4xWit3d3hUVFpuWkN2cFBrR0ZlNWlxNGdXUFhGbXZLVGQ5K053YytF?=
 =?utf-8?B?SUtuUzRnT2QzRFloOTViYnhWR2J5NTJTV29IdzFQbzFoeS9GaW1Za2NtbE9B?=
 =?utf-8?B?ZlNoaEkrbGp5REVTTU5tUzVDMU1LZUtmZlRWRnhmd3hob2x4Zyt5ZDB6Yytk?=
 =?utf-8?B?TE92eWxITkdXcXBrUnpRb2ZhbGtMNnRlZVMrRlo3TFNkNlgxZU5lVW9DL2Z4?=
 =?utf-8?B?SjkzcXpSQVhwVUdLd1J5VUtUd0ZnRk13M2YvM2d3NTBxazhHUmdWc2IydDZW?=
 =?utf-8?B?VU5URm5BR25PQ1FMYnlDWmVhdlJQNjdSWmdvOXlVY29Zc1d1cmNaSDlTYnFj?=
 =?utf-8?B?WE9OOEltcG83cTJoK0Y4eC8zQmZSQ0I4Y3VnWDlKYkZTZGlaZHBTcnZwWDcy?=
 =?utf-8?B?RUNNT2pLSmxZYkVjTkxUVUhPV0hQenJKWng1c08wakZRL1JOZVIvWFpReVlT?=
 =?utf-8?B?TDVuTnF2N0Z2RFpaY1BTejNOWkpsNDU0bTJmVk53SmNxcHRpMkdGYnZTZ0Rs?=
 =?utf-8?B?SmxTVmp1M1M4a1lpdXFlcFA4QjVLWU5SVXJraWZFa2hwOHNtK1hnZzhNMkJm?=
 =?utf-8?B?aUorS3pUUlErOEs4U2ZTdENCbDBEblAwU09BR04wVHltWGFqTUt6QWFyRWhT?=
 =?utf-8?B?dU11cjNmeTBkdTZyRWtxZEcxQTVWMmhLNlNrVHNnZy9XOHNhTWplWnRWUGh6?=
 =?utf-8?B?TGozQU9xdU5uMXpEUjM1U2tLQVlHV1pXT1E0MERwM2l3VjBDT0NZOURmaWZJ?=
 =?utf-8?B?dVZXcVU0ME1sSG83TlQvRTlwclZEZXN4M1ZUODYwcWJwaHVUcm1qMDRQVElH?=
 =?utf-8?B?L016R1BWeWJqUUZBSlNiZkUzTHBkZTRaR09DbzF2M2R2STRNeHRpS04yWTdX?=
 =?utf-8?B?UXA3NG1kSjJCcEw0UEswcXJVRnlvMmFQZUcxNTZOUHhOV3NrQ2JrTFhBMGxS?=
 =?utf-8?B?Rzk1U21mSUlFazg1MkM3L0NqZjRLZUdhRy9WMnJkWm0vdHpiZnBDREkrQ3RD?=
 =?utf-8?B?ejJ4Z2dOTzRpNi9ueTlsS2cvM2dTZVlnQ2JPK3lZa09pT1BlR3VoM3hMUU9k?=
 =?utf-8?B?c2QycVFmNmNNZGlmMkV2TTdoNGk2SE5WUUUxVm1sdjlwNFB4MnFYcVZvTnZv?=
 =?utf-8?B?cUNidi9uajhYNHA3ZXBGZXR4cFllbFkxTU1WaktOZFhneVNJTCttdVRTa3Zr?=
 =?utf-8?B?YkpQSUFVeWhKMzhNcFZEMEFOWWthYkxubXhoMzdhS1B5dzJYcFZxWXJ2b2JH?=
 =?utf-8?B?U3ViQlVBV2YxRmxmTjVOQWRPNkFUWEJvRnlCdEVWa1AzbiszMEpXMGRmNnAz?=
 =?utf-8?B?QXJRbHRNZjVJdG1JbDNGNjFxaXhzOVBCMDFUazZiYWFqQ2tlTGgyYyt6Rkdu?=
 =?utf-8?B?bDlHVGdsVWU4a09EdURkVWZkK01SZVlrSko0KzY0UkthQzVQdTQ4aWsrbzE4?=
 =?utf-8?B?UjdmdFBhZVhtMXhzeWY2T0xDVTQ0VVhKbkcrSEJRWGluWStZWmFMRnNxRlFm?=
 =?utf-8?B?a0U1d0dkYUVnU2pHSkRKWjhtaFpJYkR0eC96dlBYbnFrczZscE9mL01NeVBr?=
 =?utf-8?B?eEpJK2locWpnd1Zxb2xBcUZEK0lBQVBMZm1LR0lmNHo3TERQVlh2NU5mU2xU?=
 =?utf-8?B?UmJFdzk1OWRGaXlzbzhOb3VyVnh3KzFsc2VoMUI1ZjBWNWZBMlF3NHR3MXN3?=
 =?utf-8?B?V0V4NjdiOGNPYlp0VEJmU29HNzB1aW5HVUhoUkNnb1creU04NUx4SDBsa2Uz?=
 =?utf-8?Q?+t0w=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f74e9c86-54ab-401e-b568-08dd96b418c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 09:04:01.0128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WWFc13LOjJBg3kLPkba6ZnPJheRujilK045uMcTy50qHGMU1CVjphgflMw9MSelNhLknoMud90PyclSuqei0cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6888

DQo+IEZyb206IFBhb2xvIEFiZW5pIDxwYWJlbmlAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9uZGF5
LCBNYXkgMTksIDIwMjUgMjoyOCBQTQ0KPiANCj4gT24gNS83LzI1IDExOjU3IEFNLCBQYW9sbyBB
YmVuaSB3cm90ZToNCj4gPiBPbiA1LzYvMjUgNjoyMCBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0K
PiA+PiBGcm9tOiBQYW9sbyBBYmVuaSA8cGFiZW5pQHJlZGhhdC5jb20gU2VudDogVHVlc2RheSwg
TWF5IDYsIDIwMjUgOToxMA0KPiA+PiBQTQ0KPiA+Pj4gT24gNS82LzI1IDU6MDAgUE0sIFBhcmF2
IFBhbmRpdCB3cm90ZToNCj4gPj4+PiBGcm9tOiBQYW9sbyBBYmVuaSA8cGFiZW5pQHJlZGhhdC5j
b20gU2VudDogVHVlc2RheSwgTWF5IDYsIDIwMjUNCj4gPj4+PiA4OjA5IFBNDQo+ID4+Pj4+IE9u
IDUvNi8yNSAxMDo1NiBBTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+Pj4+Pj4gQXJlIHlvdSBn
b29kIHdpdGggIzM/DQo+ID4+Pj4+DQo+ID4+Pj4+IEknbSBzb3JyeSBmb3IgdGhlIGxhdGVuY3ku
IExldCBtZSBkb3VibGUgY2hlY2sgdG8gYXZvaWQgcG9zc2libGUNCj4gPj4+Pj4gbWlzdW5kZXJz
dGFuZGluZzsgIzMgbWVhbnM6DQo+ID4+Pj4+DQo+ID4+Pj4+IC0gMCB0byAyMywgYW5kIDUwIHRv
IDEyNyBGZWF0dXJlIGJpdHMgZm9yIHRoZSBzcGVjaWZpYyBkZXZpY2UgdHlwZQ0KPiA+Pj4+PiAr
IDAgdG8gMjMsIGFuZCA0NSB0byAxMjcgRmVhdHVyZSBiaXRzIGZvciB0aGUgc3BlY2lmaWMgZGV2
aWNlIHR5cGUNCj4gPj4+Pj4NCj4gPj4+PiBObyBjaGFuZ2UgaW4gYWJvdmUgZmVhdHVyZSBiaXRz
Lg0KPiA+Pj4+DQo+ID4+Pj4+IHVzaW5nIGJpdHMgNDYtMzkgZm9yIFVEUCB0dW5uZWwgb2ZmbG9h
ZHMgYW5kIGxpa2VseSBiaXQgNDUgZm9yDQo+ID4+Pj4+IFZJUlRJT19ORVRfRl9PVVRfTkVUX0hF
QURFUi4NCj4gPj4+Pj4NCj4gPj4+PiBUaGlzIGFsc28gdG8gdXNlIGJpdCA2OSBhcyBwcm9wb3Nl
ZC4NCj4gPj4+Pg0KPiA+Pj4+PiBUaGUgVklSVElPX05FVF9GX0NUUkxfR1VFU1RfT0ZGTE9BRFMg
bWFwcGluZyBzaG91bGQgYmUNCj4gc3BlY2lmaWVkDQo+ID4+Pj4+IGFmdGVyIGV2ZW50dWFsbHkg
YSBuZXcgb2ZmbG9hZCBmZWF0dXJlIHdpbGwgYmUgZGVmaW5lZCB1c2luZyBhIGJpdCA+PSA2NC4N
Cj4gPj4+Pj4NCj4gPj4+PiBOby4gVURQIHR1bm5lbCBmZWF0dXJlIGJpdHMgNjUgdG8gNjggbWFw
cyB0byBjb21tYW5kIGJpdHMNCj4gNDYsNDcsNDgsNDkuDQo+ID4+Pj4gVGhpcyBpcyB0aGUgb25s
eSBkZXNjcmlwdGlvbiBjaGFuZ2UgaW4NCj4gPj4+IFZJUlRJT19ORVRfRl9DVFJMX0dVRVNUX09G
RkxPQURTIGNvbW1hbmQuDQo+ID4+Pj4gV291bGQgaXQgd29yaz8NCj4gPj4+DQo+ID4+PiBBRkFJ
Q1QsIHllcywgaXQgc2hvdWxkIHdvcmsuDQo+ID4+Pg0KPiA+Pj4gQnV0IGl0IHdpbGwgbm90IGF2
b2lkIHRoZSBpbW1lZGlhdGUgbmVlZCB0byBleHBhbmQgdGhlIHZpcnRpbw0KPiA+Pj4gZmVhdHVy
ZXMgbmVnb3RpYXRpb24gYWJvdmUgNjQgYml0cywgd2l0aCB0aGUgYWxyZWFkeSBtZW50aW9uZWQN
Cj4gY29tcGxleGl0eS4NCj4gPj4+DQo+ID4+PiBJIHdvdWxkIHByZWZlcmFibHkgYXZvaWQgdGhh
dCwgaWYgcG9zc2libGU6IEkgcmVzdGFydGVkIHRoaXMgdGhyZWFkDQo+ID4+PiB3aXRoIHN1Y2gg
YSBnb2FsLg0KPiA+Pj4NCj4gPj4gSW4gdGhhdCBjYXNlIHdlIHNob3VsZCBhZG9wdCAjMi4NCj4g
Pg0KPiA+IERvIHdlIGhhdmUgcXVvcnVtPyBTaG91bGQgSSBzZW5kIGEgcGF0Y2g/DQo+IA0KPiBB
cyBwZXIgb2ZmLWxpc3QgZGlzY3Vzc2lvbiB3aXRoIE1pY2hlbCwgdGhlcmUgaXMgbm8gYWdyZWVt
ZW50IG9uIHJlc2VydmVkIGJpdHMNCj4gcmUtdXNlLg0KPiANCj4gVGhhdCBtZWFucyB0aGUgb25s
eSBhdmFpbGFibGUgb3B0aW9uIGlzICMzIGFib3ZlLg0KPiANCj4gQFBhcmF2LCB3b3VsZCB5b3Ug
c2VuZCBhIHBhdGNoIHRvIGZpeCB0aGUgb2ZmbG9hZHMgPD4gZmVhdHVyZXMgbWFwcGluZywgb3Ig
ZG8NCj4geW91IHByZWZlciBJJ2xsIGRvIGl0Pw0KPiANCklmIGl0cyB1cmdlbnQsIHBsZWFzZSBk
byBpdC4NCklmIGl0IGNhbiB3YWl0IHRpbGwgMjIgTWF5IHRoaXMgd2VlaywgSSB3aWxsIHByZXBh
cmUgb25lLg0KDQo+IFRoYW5rcywNCj4gDQo+IFBhb2xvDQoNCg==
