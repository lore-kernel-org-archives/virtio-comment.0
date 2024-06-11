Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB65B8488
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 05:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718085379; cv=fail; b=CwiiNuaT1t/ie8EAxqwLq6CwKy0ooMVqrVFf4vUnDe2U/OkaYT+ZXlFJqjVw/aaSeuT6lGV3QBMAhQngcViYeq5aK3IzLtR9+84FVn6eOFSzpBpH5c1BEckQfApF5Mr3r7UPyy8n5h351rrAgt6+SFdB444EWoa2xUcSWCPdCTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718085379; c=relaxed/simple;
	bh=svZk3oNiBSEg2/oF0Kn0H1rtPOh5NFcDH2O2R0bhb3w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BA1z0dS96e6kVS7FtYCk54aS/beqFjF6JrICjYHlPK4Hf2LoVOrpXpAgUWkZSBBHurPpgCjweVloDrR9lPZFz2VdlVJXjMyJAk8/5MPIaoAXezhR+Rn777iVtdcyQEyq6BUfm4WbfbWtEBy/z1ZIbzi3c75G6D7ZcJJelYkJGaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IF5RJGyC; arc=fail smtp.client-ip=40.107.93.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IF5RJGyC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbwS9/mLvZEjZV0/QhZVnHMl5POgdH6UGz0wkolaCW2XXWIsB0zh+7PdyglF+XysXf59gVcEMFBbIk4wI+vwwp5NAcsbVtLiShyPNhJzYhIKl8l2MuMm5uUQjMZ3RIoSRj0BH+vTXDbfLYTj+d5pwCpJ7ue172nCTtH10KWRqeckCBFbaooJ1BqtytEvjBG0k4KurUZtiVrBuUsEwqIb+kg5LHXFtibW7TcouOzw0twIOxb/eB/JUqt9XOMmdRYyWJL+ctH7ae59pYuzPEeFMpz6nQkIIPmpYmp9TyIr3ElnV3HwpuD2zyxCJi/5wIhvnF/vg6e0K7g2vNrVMU/mkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svZk3oNiBSEg2/oF0Kn0H1rtPOh5NFcDH2O2R0bhb3w=;
 b=A6j0R7XykBVrLH1G92/q1SeYzxFpVx1oBV+l+iM8488R8Le1slzYbx3yRd8+o+FY6NPzfcLmWMkAGPgrkyBpTBlooRvmGfyLFSxFqeEPp60ymcmrgXnVbGXx8NU1vLMvqKO5ejvQYSVFm50wWGQPFxEwsxHVumeqmxApa0a+iaidYz6PDjyteU8IM33TuP++d6xdzd2GEerK1FjQAcjl7nMmAhmqD3BhJGdXp7v/0m4GW0RBXBZk10cgLbbQoHv0E11C70PzqKoOiNcd4M6JJ8FYzb86eZmj9ez85Pz8oJJQ/tyLReBMPzOKBb4aUsltAgRxMB+ug/osefGN1Z7uTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svZk3oNiBSEg2/oF0Kn0H1rtPOh5NFcDH2O2R0bhb3w=;
 b=IF5RJGyC/IY9Z7k4wb3Ds8J62E/zTMPaSJEC6ePRqE10Dhm0j06CeLbFjHSVtwdMXXsFxRyKyXvajrN5P8GnCcwEzhxUXTdnwnKABeBP33KKNh0duGJzvJ3UVLrrNQ+IVdc2hOFhnyK4DQWA8r1O0BZtpijysCxz40oobVjFw+C/0LGjF6isEUsBiWv5JOroAqjGOTJlW4HKYih00OHlb3MEFqqhUzGrnETCu2XolhNxtXIuCI2TDoKbPORh/eQUpYoNwHD8Qlugc3eleDNw306HH8PfRN8rjFpsVXZO7ksbUbREELtQJqWwtDkP+Sxw5Rc4aLg3HSTHc+KfTTeTmQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 05:56:14 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7633.037; Tue, 11 Jun 2024
 05:56:14 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
CC: Viresh Kumar <viresh.kumar@linaro.org>, Vincent Guittot
	<vincent.guittot@linaro.org>, =?utf-8?B?QWxleCBCZW5uw6ll?=
	<alex.bennee@linaro.org>, "stratos-dev@op-lists.linaro.org"
	<stratos-dev@op-lists.linaro.org>, Manos Pitsidianakis
	<manos.pitsidianakis@linaro.org>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH V4] virtio-transport: Clarify requirements
Thread-Topic: [PATCH V4] virtio-transport: Clarify requirements
Thread-Index: AQHatl+HaqpvWFIPXUaRuedMixyUarG5GScAgAkBozA=
Date: Tue, 11 Jun 2024 05:56:14 +0000
Message-ID:
 <PH0PR12MB5481739645D5EBCA8A1EBAFCDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <19a5f63c2d88f88f76f5cfc94793aa182d1eeb7f.1717492057.git.viresh.kumar@linaro.org>
 <87plsvlgv1.fsf@redhat.com>
In-Reply-To: <87plsvlgv1.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB7955:EE_
x-ms-office365-filtering-correlation-id: 02e576cc-fb20-4d12-ab65-08dc89db33f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q0hrMTdTVlA0dFRQaWdCZGlYS2RCRFU2WFdDbEJJMWpWZGJLUldPbjI2UDRK?=
 =?utf-8?B?R3NrZjJ4ZURSekE4TlhySDJiRFlHNHBSWDdoV3FrVWJHcE41RWc5Wnp2ZjA1?=
 =?utf-8?B?MWtERkVOdGhSOGtuemVyc0JIZGs2K3Rpdy9JaDVHb3dSeVMveG1wTjVteWFP?=
 =?utf-8?B?Y3JTdkxNdnFMTWd2ZHUrVGpSVCtXRXhBeDEvMWNJN3hqZnRGV0RVWnpodjNr?=
 =?utf-8?B?RFErU00rUnlOU2dVYkNJYWlrdEhrYittYzZPZnNzd2xTUy9Tdkl0UkhyWTNW?=
 =?utf-8?B?SzhPSzVib1UwR2h4cDk4UUFRamZPOXByVTF6V3pvbVA3SEdVeFFSc2VLc09l?=
 =?utf-8?B?eVc3OGlmUmY0Yld6NUJrMTNtd1J2Vmx6eXhpY1VhaUJSWWZqdU9HWFhWdmVk?=
 =?utf-8?B?OUVxamY3UzlBdmlhcEozc01nUy9Oalp1V3JVOVMvbFdFQy9PT08xeVF0YlZY?=
 =?utf-8?B?SUZpL0FMNjlzbUpaQXpZUStsb0N0V2l5Rjd3bHU0OWpOMFZtNGJvQ2tjZlla?=
 =?utf-8?B?c2JTVmZ5N0FrWUR4b3laUUxIR095MS9Vb0tkaWJ4RzNacjlIR1JEczdVWnlh?=
 =?utf-8?B?ckZST3NCMGlqRVkwTldSb24yalo5b3pXKzE5dG5GMXRZY3RHYVNzdGZ5Wmw0?=
 =?utf-8?B?bWlFaHdjVXRGNjhjbVlnMW5nOWtwVU1VWmJER0t2UkVlTVhOWllDMjEzOU05?=
 =?utf-8?B?ZjRLeTUyZXRMRzQxeCtjTHU4K2RrZEhINXlSbnlMSGd6R2hnMmphTjBNSXh6?=
 =?utf-8?B?QzVjSW5YaHVNUXlua1lEeFlqWkdnRklWTG1EbWRWWlVHK09EU2Nna2I1aHFL?=
 =?utf-8?B?Y0hhUDBmMk53elRWYms3ZFpMK2RyS1RwV2ZzdXBHYW5JUEkzbTZzdE9ZQy8w?=
 =?utf-8?B?VjYzb3JzNmgySlM4LzNjQlJFWlhlTm4rRW5xb1lJajgyWHhvMVB0QVJNMFlB?=
 =?utf-8?B?ZC9kZURXZGhLbkwremR6c0ZDOFdxbEN1Z3I4eFh4REtGdWd4UlUzdFdSQTlV?=
 =?utf-8?B?SUl5b0UrejFkZGMwbkVFRUlQdFN1M0NHS0w3KzBzejJOTjlwUzhzQURiSC9N?=
 =?utf-8?B?RG5KS3ArelFuUitLekpRWStrRFh2dmNmRVpHVWVNZHVCb0lqdHFmU09tZlNR?=
 =?utf-8?B?eXRJYjJxYUxtSXN4L2RRWXBXSHZwK0t5UGhoL0lIQmYrd0pJNDhwOVJYZGJ1?=
 =?utf-8?B?eW9SRzZhTm5NcjY0cG5ZYmJrUXFnR3FLVUg5RE1Cb1V3VmlCMFYra3QzOG5U?=
 =?utf-8?B?TENtQ2UrTHFndEh4SEVEZzAyQ3pSV3E4RUp5RWFnTTR4cW0xdm5SRWZINyto?=
 =?utf-8?B?dnZzYy9jQWZRUEYvOFNuMXc4blBaSmp3dTVmKzVDeDlnNjBqak1ZdXBERmJC?=
 =?utf-8?B?QkwrU1k0WkVXN2hscjJvd3VsY2RYOEQ3UzZXM3BOWUQ4dGgyRTVvS1IrMmFR?=
 =?utf-8?B?a1lvRU1teVhjZ1doYW00ejZUcVh3VzQxSkw3U25wMDR2bUw3U1Y1eVdDeHB0?=
 =?utf-8?B?QjBoKzY3Y3BLbDR6aEtwbnloVmNRMWplS0JSb1NUTkZwV2xNWVFyT2VKdGF0?=
 =?utf-8?B?UmQxSmg1V1J4em9sb2RyQzgwUUI2amNMb1VFRUwrb040NENmeEU4aEg3bDg4?=
 =?utf-8?B?Rm42Y0hGenZnbWZ6cG1GeTEwMEkybmN2M0paU1YvdU4rMFJqRUZJK1loMUU1?=
 =?utf-8?B?UmhFR2J4ZU1LTkNNaWVTcUZYcnlwWUUrTjlrRG9rOUpnYnQ4aTluZjJvVGFD?=
 =?utf-8?B?VGdpalIrMFJFQSs4dlBTU1UrNEtLeVJDTlhrUnhLaFpVaUxrV1ZmVHJIRjVR?=
 =?utf-8?Q?UnVzt2VcYPWaZPgX6YnOC/vX6yi+DnreTUfVg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aHJCSEdobXJ4K2M5dCtVTXlxVnowdno3dGw0Ym1rT2V3N2htTVRnbnhIcWl2?=
 =?utf-8?B?K3FQMzlEUG05dDkvOXVSa0NMcVpiSTM5N3RHaEJxNGkrV01zTVE3SVJzN3Fw?=
 =?utf-8?B?aTV5VVBPc3ZTSjdnUTh6dnZRTy9za2ZEcyt6aHBHaXRBa1ZqbEpKeWplSjRG?=
 =?utf-8?B?NHR1QWF0QjdlMUpOVTNqdk9oUGpWNTlrREtMK2RnYis3ZHpOWDBOU2pUcUw1?=
 =?utf-8?B?MHhkMnQ4Wm14b3RidUxWRHdkQWw3UndBRDRPdHZSMVJSaDAvanYvbUx5VUsw?=
 =?utf-8?B?blE4elpvMkFRbGEwbE5CSzNZRDB5OWhRek5iaVRQanpsZi93NnZYZHR5cUpm?=
 =?utf-8?B?dVlBc0hsMkVqUURQK2RZcFZmVFZkSHFyNVMvUTRIeGwwMFlvN0RTblN4TnQy?=
 =?utf-8?B?K3JGejFhS3pleFVxVjZVMUdwZHAwZ3lQb2VneWFWMUtOSitMRS92N3ZKOGFO?=
 =?utf-8?B?WGs0VUo0R1dyUm5UaTBMdWloYTBFNzFBTDBiQk1Gc05VeGVXb2Y1b2pQRVRu?=
 =?utf-8?B?aCtIVE5zRktwR0lMUmwvV0dLa0lXcXVWdnVSd0lGdlhGQjUvd29vczA0WFh4?=
 =?utf-8?B?ZnZOWVFZcy8vNndqRXRjdFpWeSs5NTV0VE51UVlnNTIvQ3d4czZXQzFTN0F3?=
 =?utf-8?B?Um1RSTVPQW5vMTduOEloUmlXWldmMHFtamVDa0lWT2lZZUpab21nTjY5dDZo?=
 =?utf-8?B?R0lRdUw0VEJ2Ri8zYnZnZEN2SSs0OHRwZ0tLczdXMUM1eVdYRmpCYUJ6RWJ5?=
 =?utf-8?B?aUk5ejh5elA2Z3M2UWdzMEhIbURpUS9ESmxxM082cno1a2UrWU1YWEZpUCtz?=
 =?utf-8?B?UDZPcDgxWk1BdXhjWmNRdlVXdnZGVUZ5NlRwcHRIVG9mNlh6eUswQnFQa3Jp?=
 =?utf-8?B?bDZKY28rcGhqbEY5UW9HZU1tR1dsSzNWK2haUklSL0RxVTFaT1lSQUs4dHV1?=
 =?utf-8?B?QmovUE1xcWV4T0E2cmtSMGxyNXdnWitOREI4Vm1jT0V3dm9GMHgzRHdFODZj?=
 =?utf-8?B?UFJvN2NKbXhQNUdkdmhiSnZ2RHB6bWlOdjlXU1NnbVFiT0FjVmhFSTJsdy9X?=
 =?utf-8?B?OXlLRjZ0U1FyaW9UeVg5a3VDWHNJQ3A5LzA2WGZDL1Q0VkR0S0QxTTQ3V2gx?=
 =?utf-8?B?MmNUQVpRVTVMYjNZWDl1d2t5KzVpbXZpRXJhaEY2S21nUktwVWhYak93Y1B4?=
 =?utf-8?B?d3QySGtsbGFHVXAvRFpvRXdjZGE0MUNTVmY4TUJ0NEJqaXRXZklPZGVYNnF1?=
 =?utf-8?B?RHpROE5CNk55em1CTENjNnQ1bzViOXJGem85N3RadlBYYzFKZ0I4R2JtSlR4?=
 =?utf-8?B?TCs3WVdOSENhUS9nNHZqVy9rOHlUdTBjS3pnaGRKeUk5Tys5cHc5OUJJaERC?=
 =?utf-8?B?Tm5pdkVqZTZHVnJHSjBHVjNpZ3NjT2pwazJtRklGc1BwZlFtOWVaSVZHS09s?=
 =?utf-8?B?dkxzOUJBczNObjRBa0loTGFlSStkTmJtdDJvUXF6SGJPelhyUWRsVyt5MlZo?=
 =?utf-8?B?VVZRcTUzZHI2cGdxSHphcmJUY3BkQW5pUkN1ZXRmSEhkcFFMakxuT21lZ0R2?=
 =?utf-8?B?MjdtMVlldFVLNmRST3BxNy90d0JHekF2ZXhRVEVSNDF5SWF5RlozeHE4Nmpa?=
 =?utf-8?B?YnlHMnlnNFdCRHUrdDNNTWdleWN3TllLaVBxRlVzT2ZsZmhUR0xrTnI4U2cz?=
 =?utf-8?B?NGFURUxwVmVlUkl3TGtLRXRPTzQwNS9OWU4wYU54UG10alIrZUF2WFJTYWwv?=
 =?utf-8?B?Q0U2eHdyeU5zR053YnkzVVJqSC9qenlCb3JRL1A4b1ZqVlJPVlVxYk5VeG9v?=
 =?utf-8?B?UjJza0dQeDdJUzhsRUNqaU1lQkdOQ3FIbDAvWGhQSUtiRXNza1k1MkhReGxs?=
 =?utf-8?B?ZGNPbElaeVMydlpPOG9RTkRVTGdXUFdVRTJvbldybWxieU4xVzVSQ3kxWXFi?=
 =?utf-8?B?WEZEVkYwVEdCQXdCUVFYVGhBVjBDUEZxTnhXMVpzejVGZzZUL1poK2xGYWdF?=
 =?utf-8?B?MnVEak4vZkI2MS9maTgrTXBlMUlFMmM5aCtCWFlsYmJoSWNTMXVOaUFybENQ?=
 =?utf-8?B?eWtkMlFQaHlBM3BrKytiVldscE9pa294SGVrMldqQ1ZFVERZR29KMGhHd1dB?=
 =?utf-8?Q?9iCU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e576cc-fb20-4d12-ab65-08dc89db33f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 05:56:14.2024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3DLMEWucipRY8+rtVRH1aXFD5K5enB+0ed0puaKlMzqfnQS0nTr8Q7ts0E8JsICh/r+KCirj1KrmL94LCtDWsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955

SGkgQ29ybmVsaWEsDQoNCj4gRnJvbTogQ29ybmVsaWEgSHVjayA8Y29odWNrQHJlZGhhdC5jb20+
DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSA1LCAyMDI0IDU6NTIgUE0NCj4gDQo+IE9uIFR1ZSwg
SnVuIDA0IDIwMjQsIFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+IHdyb3Rl
Og0KPiANCg0KWy4uXQ0KDQo+ID4gK1RoZSB0cmFuc3BvcnQgcHJvdmlkZXMgYSBtZWNoYW5pc20g
Zm9yIHRoZSBkcml2ZXIgdG8gcmVhZCB0aGUgZGV2aWNlDQo+ID4gK3N0YXR1cy4gVGhlIHRyYW5z
cG9ydCBNVVNUIHByb3ZpZGUgYSBtZWNoYW5pc20gZm9yIHRoZSBkcml2ZXIgdG8NCj4gPiArY2hh
bmdlDQo+IA0KPiBzL01VU1QgcHJvdmlkZS9wcm92aWRlcy8NCg0KQ2FuIHlvdSBwbGVhc2UgZXhw
bGFpbiB3aHkgdGhpcyByZXF1aXJlbWVudCBzaG91bGRu4oCZdCBmb2xsb3cgdGhlIFJGQyAyMTE5
Pw0KVGhpcyBleHBsYW5hdGlvbiB3aWxsIGhlbHAgdG8gd3JpdGUgZnV0dXJlIHJlcXVpcmVtZW50
cyB3aXRoL3dpdGhvdXQgc3VjaCBrZXkgd29yZHMuDQo=
